#include <PID_v1.h>
#include <Arduino.h>
#include <PushButtonController.h>
#include <RSLatch.h>
#include <Adafruit_INA260.h>
#include <Adafruit_MCP4725.h>
#include <ArduinoJson.h>
#include <TM1637Display.h>

#define DEBUG true
//I/O pin assignments
#define OVEN_TEMP_IN_PIN A0
#define COMP_TEMP_IN_PIN A1
#define HEAT_COOL_SELECT_OUT 2
#define OVEN_DRIVE_PWM 11
#define BATTERY_TYPE_OUT_PIN 3
#define INTERNA_EXTERNAL_PIN 1
#define INPUT_ON_OFF_OUT 12
#define STAT_1 7
#define STAT_2 6
#define POWER_ON_NOT 5
#define PLUS_LOAD 4
#define NUMBER_OF_TEMPERATURES 5
#define NUMBER_OF_VOLTAGE_READINGS 10
#define NUMBER_OF_CURRENT_READINGS 10
#define DISPLAY_1_CLK 22
#define DISPLAY_1_DIO 23
#define DISPLAY_2_CLK 24
#define DISPLAY_2_DIO 25

#define THOUSANDS_DEC_PT  0b10000000
#define HUNDREDS_DEC_PT 0b01000000
#define TENS_DEC_PT 0b00100000

TM1637Display display_1(DISPLAY_1_CLK, DISPLAY_1_DIO);
TM1637Display display_2(DISPLAY_2_CLK, DISPLAY_2_DIO);

//I2C addresses
#define BAT_CURRENT_DAC 0x63
#define BAT_VOLTAGE_DAC 0x62
#define BAT_METER 0x40

volatile bool json_transmit{true};

int const V_UVLO = 4500;
int const V_UVLO_HYS = 100;
int const V_TH = 5100;
int const V_BI_6V = 6981;
int const V_BI_12V = 13500;
int const I_TAPER = 312;
int const V_BOOST_6V = 7249;   //7349;
int const V_BOOST_12V = 14625; //14725;
int const V_FLOAT_6V = 6825;
int const V_FLOAT_12V = 13650;
int const V_RCH_6V = 6143;
int const V_RCH_12V = 12285;
int const JSON_TRANSMIT_INTERVAL = 2000;

Adafruit_MCP4725 battery_voltage_out;
Adafruit_MCP4725 battery_current_out;
Adafruit_INA260 battery_meter;

//States
enum State
{
    UV_LOCKED,
    PRE_CHARGE,
    BULK_CHARGE,
    BOOST_CHARGE,
    FLOAT_CHARGE
};

//Json document for serialization of data
const int capacity = JSON_OBJECT_SIZE(50);
StaticJsonDocument<capacity> jdoc;
char receive_buffer[1024];
bool serial_recieved{false};

static State state;
bool battery_6V;                      //True = 6V battery
bool internal;                        //True = internal
bool cool;                            //True = cool
volatile static bool manual_selected; //True = manual_selected
volatile bool on_selected;            //True = on
bool start_selected;                  //True = start_selected_selected
bool setup_menu;                      //True = in setup
bool voltage_temp_select;             //True = display voltage and current
bool heart_beat;
bool stat_1;
bool stat_2;
bool power_on_not;
bool plus_load;
bool oven_on;

static int DELTA_T{200};
static int DELTA_VOLTS{100};
static int DELTA_M_AMPS{100};

static double battery_target_current;
static double battery_set_current;
static double battery_actual_current;

static double battery_target_voltage;
static double battery_set_voltage;
static double battery_actual_voltage;
static double battery_adjust_voltage;

static volatile int bVolt_last_millis;
static volatile int bAmp_last_millis;
static volatile uint32_t json_transmit_last_millis;
static volatile uint32_t voltage_controller_last_millis;
static volatile uint32_t debug_millis;

static volatile int heart_beat_last_millis;

double oven_temperature;
double oven_temperatures[NUMBER_OF_TEMPERATURES];
uint8_t oven_temperatures_index;
double oven_set_point;
double oven_drive;
double oven_drive_adjust;
double oven_Kp = 5, oven_Ki = 2, oven_Kd = 0;
double voltage_Kp = 1, voltage_Ki = 0, voltage_Kd = 0;
double comp_temperature;
double comp_temperatures[NUMBER_OF_TEMPERATURES];
uint8_t comp_temperatures_index;

PID oven_controller(&oven_temperature, &oven_drive, &oven_set_point,
                    oven_Kp, oven_Ki, oven_Kd, DIRECT);

PID voltage_controller(&battery_actual_voltage, &battery_adjust_voltage,
                       &battery_target_voltage, voltage_Kp, voltage_Ki,
                       voltage_Kd, DIRECT);

int mVolts_to_units(int const m_volts)
{
    double x = m_volts;
    x /= 0.8035;  //DAC output
    x *= 1 / 9.2; //Power amp gain
    return x;
}
int mAmps_to_units(int const m_amps)
{
    double x = m_amps;
    x /= 0.8059;                                 //Dac conversion
    double V_set = 4.75 - (13750 * (x) / 15000); //OPA547 current limit formula
    V_set /= 1.5;
    return V_set; //Buffer amp gain set to 1.5
}

int read_m_volts(uint16_t const pin_number)
{
    analogReadResolution(12);
    int mVolts = analogRead(pin_number);

    mVolts *= 812;
    mVolts /= 1000;
    return mVolts;
}

int serialize_data()
{
    jdoc["state"] = state;
    jdoc["battery_6V"] = battery_6V;
    jdoc["internal"] = internal;
    jdoc["cool"] = cool;
    jdoc["manual_selected"] = manual_selected;
    jdoc["on_selected"] = on_selected;
    jdoc["start_selected"] = start_selected;
    jdoc["setup_menu"] = setup_menu;
    jdoc["voltage_temp_select"] = voltage_temp_select;
    jdoc["heart_beat"] = heart_beat;
    jdoc["DELTA_T"] = DELTA_T;
    jdoc["DELTA_VOLTS"] = DELTA_VOLTS;
    jdoc["DELTA_M_AMPS"] = DELTA_M_AMPS;
    jdoc["battery_target_current"] = battery_target_current;
    jdoc["battery_actual_current"] = battery_actual_current;
    jdoc["battery_target_voltage"] = battery_target_voltage;
    jdoc["battery_actual_voltage"] = battery_actual_voltage;
    jdoc["oven_temperature"] = oven_temperature;
    jdoc["oven_set_point"] = oven_set_point;
    jdoc["comp_temperature"] = comp_temperature;
    jdoc["oven_drive"] = oven_drive;
    jdoc["stat_1"] = stat_1;
    jdoc["stat_2"] = stat_2;
    jdoc["power_on_not"] = power_on_not;
    jdoc["plus_load"] = plus_load;
    jdoc["oven_on"] = oven_on;
    jdoc["oven_drive"] = oven_drive;
    jdoc["oven_drive_adjust"] = oven_drive_adjust;

    return serializeJson(jdoc, SerialUSB);
}

int read_temp(uint16_t const pin_number)
{
    /* TMP36 Output voltage scaling 10mv/degree C
    500 mv offset, 750mv @ 25C
    */
    int temperature = 0;

    temperature = read_m_volts(pin_number);
    temperature -= 500;
    temperature /= 10;
    return temperature;
}

void set_m_volts(uint8_t pin_number, int m_volts)
{

    int units = m_volts / .8058608059;

    analogWriteResolution(12);
    analogWrite(pin_number, units);
}

void set_pwm(uint8_t pin_number, uint8_t out_value)
{
    if (out_value > 255)
        out_value = 255;
    if (out_value < 0)
        out_value = 0;
    analogWrite(pin_number, out_value);
}

void setup()
{
    manual_selected = true;
    battery_6V = true;
    state = PRE_CHARGE;
    setup_menu = false;
    oven_controller.SetOutputLimits(0, 255);
    oven_controller.SetMode(AUTOMATIC);
    oven_controller.SetSampleTime(200);
    oven_temperatures_index = 0;
    comp_temperatures_index = 0;
    voltage_controller.SetOutputLimits(-1000, 1000);
    voltage_controller.SetMode(AUTOMATIC);
    voltage_controller.SetSampleTime(200);
    voltage_controller_last_millis = 0;
    start_selected = false;
    display_1.setBrightness(0x0f);
    display_2.setBrightness(0x0f);

    pinMode(BATTERY_TYPE_OUT_PIN, OUTPUT);
    pinMode(INTERNA_EXTERNAL_PIN, OUTPUT);
    pinMode(HEAT_COOL_SELECT_OUT, OUTPUT);
    pinMode(INPUT_ON_OFF_OUT, OUTPUT);
    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(OVEN_DRIVE_PWM, OUTPUT);
    pinMode(STAT_1, INPUT);
    pinMode(STAT_2, INPUT);
    pinMode(POWER_ON_NOT, INPUT);
    pinMode(PLUS_LOAD, INPUT);
    battery_current_out.begin(BAT_CURRENT_DAC);
    battery_voltage_out.begin(BAT_VOLTAGE_DAC);
    battery_meter.begin(BAT_METER);
    battery_meter.setMode(INA260_MODE_CONTINUOUS);
    battery_meter.setAveragingCount(INA260_COUNT_64);
    battery_meter.setVoltageConversionTime(INA260_TIME_2_116_ms);
    battery_meter.setCurrentConversionTime(INA260_TIME_2_116_ms);

    uint32_t now = millis();
    bVolt_last_millis = now;
    bAmp_last_millis = now;
    json_transmit_last_millis = now;
    heart_beat_last_millis = now;
    debug_millis = now;

    SerialUSB.begin(9600);
}
void loop()
{

    /***************************************************************************
     * Oven temperature managment
    ***************************************************************************/
    /*#region oven temperature management*/

    oven_temperatures[oven_temperatures_index] = read_temp(OVEN_TEMP_IN_PIN);
    oven_temperatures_index < NUMBER_OF_TEMPERATURES ? oven_temperatures_index++ : oven_temperatures_index = 0;

    oven_temperature = 0;
    for (int i = 0; i < NUMBER_OF_TEMPERATURES; i++)
    {
        oven_temperature += oven_temperatures[i];
    }
    oven_temperature /= NUMBER_OF_TEMPERATURES;

    if (oven_on)
    {
        if (cool)
        {
            oven_controller.SetControllerDirection(1);
        }
        else
        {
            oven_controller.SetControllerDirection(0);
        }
        oven_controller.Compute();
        // if ((oven_drive + oven_drive_adjust) > 255)
        // {
        //     oven_drive = 255;
        // }
        // else
        // {
        //     oven_drive += oven_drive_adjust;
        // }
        // if (oven_drive < 0)
        // {
        //     oven_drive = 0;
        // }
    }
    else
    {
        oven_drive = 0;
        oven_drive_adjust = 0;
    }

    if (DEBUG)
    // {
    //     if (millis() - debug_millis > 2000)
    //     {
    //         {
    //             SerialUSB.print("\noven_set_point: ");
    //             SerialUSB.print(oven_set_point);
    //             SerialUSB.print("  oven_temperature: ");
    //             SerialUSB.print(oven_temperature);
    //             SerialUSB.print("  oven_drive: ");
    //             SerialUSB.print(oven_drive);
    //             SerialUSB.print("  oven_drive_adjust: ");
    //             SerialUSB.println(oven_drive_adjust);
    //             debug_millis = millis();
    //         }
    //     }
    // }

    set_pwm(OVEN_DRIVE_PWM, oven_drive);

    /* #endregion*/

    /***************************************************************************
     * Component temperature management
    ***************************************************************************/
    /*#region comp temperature management*/
    comp_temperatures[comp_temperatures_index] = read_temp(COMP_TEMP_IN_PIN);
    comp_temperature = 0;
    for (int i = 0; i < NUMBER_OF_TEMPERATURES; i++)
    {
        comp_temperature += comp_temperatures[i];
    }
    comp_temperatures_index < NUMBER_OF_TEMPERATURES ? comp_temperatures_index++ : comp_temperatures_index = 0;
    comp_temperature /= NUMBER_OF_TEMPERATURES;

    /* #endregion*/

    // /***************************************************************************
    //  * Battery voltage / current management
    // ***************************************************************************/
    /*#region battery voltage and current management*/

    battery_actual_voltage = battery_meter.readBusVoltage();
    battery_actual_current = battery_meter.readCurrent();

    if (battery_actual_current < 0)
        battery_actual_current = 0;

    if (millis() - voltage_controller_last_millis > 1000)
    {
        voltage_controller.Compute();
        battery_set_voltage += battery_adjust_voltage;

        if (battery_set_voltage < 0)
        {
            battery_set_voltage = 0;
        }
        battery_voltage_out.setVoltage(mVolts_to_units(battery_set_voltage), false);
        battery_current_out.setVoltage(mAmps_to_units(battery_set_current), false);
        voltage_controller_last_millis = millis();
    }
    // if (DEBUG)
    // {
    //     if (millis() - debug_millis > 2000)
    //     {
    //         {
    //             SerialUSB.print("\nbattery_actual_voltage: ");
    //             SerialUSB.print(battery_actual_voltage);
    //             SerialUSB.print("\tbattery_set_voltage: ");
    //             SerialUSB.print(battery_set_voltage);
    //             SerialUSB.print("\tbattery_adjust_voltage: ");
    //             SerialUSB.println(battery_adjust_voltage);
    //             debug_millis = millis();
    //         }
    //     }
    // } 

    /* #endregion*/

    /***************************************************************************
     * Json transmit 
    ***************************************************************************/
    /*#region Json transmit*/
    if (json_transmit)
    {
        if ((millis() - json_transmit_last_millis) >= JSON_TRANSMIT_INTERVAL)
        {
            serialize_data();
            json_transmit_last_millis = millis();
        }
    }
    /* #endregion*/

    /***************************************************************************
     * Relay control and input control
    ***************************************************************************/
    /*#region Relay control*/

    digitalWrite(BATTERY_TYPE_OUT_PIN, battery_6V == true ? HIGH : LOW);
    digitalWrite(INTERNA_EXTERNAL_PIN, internal == true ? HIGH : LOW);
    digitalWrite(HEAT_COOL_SELECT_OUT, cool == true ? HIGH : LOW);
    digitalWrite(INPUT_ON_OFF_OUT, on_selected == true ? HIGH : LOW);

    stat_1 = digitalRead(STAT_1);
    stat_2 = digitalRead(STAT_2);
    power_on_not = digitalRead(POWER_ON_NOT);
    plus_load = digitalRead(PLUS_LOAD);

    /* #endregion*/

    /***************************************************************************
     * Display control 
    ***************************************************************************/
    /*#region Display control*/
    if (voltage_temp_select)
    {
        display_1.showNumberDec(battery_actual_current);
        display_2.showNumberDec(battery_actual_voltage/10);
    }
    else
    {
        display_1.showNumberDec(oven_temperature);
        display_2.showNumberDec(comp_temperature);
    }

    /* #endregion*/

    /***************************************************************************
     * Heart beat 
    ***************************************************************************/
    /*#region Heart beat*/
    if (millis() - heart_beat_last_millis >= 1000)
    {
        heart_beat = !heart_beat;
        digitalWrite(LED_BUILTIN, heart_beat == true ? HIGH : LOW);
        heart_beat_last_millis = millis();
    }
    /* #endregion*/

    /***************************************************************************
     * Serial receive and un-pack
    ***************************************************************************/
    /*#region Serial receive and un-pack*/
    uint32_t index = 0;
    while (SerialUSB.available())
    {
        receive_buffer[index] = SerialUSB.read();
        index++;
        serial_recieved = true;
    }
    if (serial_recieved)
    {
        serial_recieved = false;
        deserializeJson(jdoc, receive_buffer);
        //unpack the json data
        if (jdoc.containsKey("state"))
        {
            state = jdoc["state"];
        }
        if (jdoc.containsKey("battery_6V"))
        {
            battery_6V = jdoc["battery_6V"];
        }
        if (jdoc.containsKey("internal"))
        {
            internal = jdoc["internal"];
        }
        if (jdoc.containsKey("cool"))
        {
            cool = jdoc["cool"];
        }
        if (jdoc.containsKey("manual_selected"))
        {
            manual_selected = jdoc["manual_selected"];
        }
        if (jdoc.containsKey("on_selected"))
        {
            on_selected = jdoc["on_selected"];
        }
        if (jdoc.containsKey("start_selected"))
        {
            start_selected = jdoc["start_selected"];
        }
        if (jdoc.containsKey("voltage_temp_select"))
        {
            voltage_temp_select = jdoc["voltage_temp_select"];
        }
        if (jdoc.containsKey("heart_beat"))
        {
            heart_beat = jdoc["heart_beat"];
        }
        if (jdoc.containsKey("DELTA_T"))
        {
            DELTA_T = jdoc["DELTA_T"];
        }
        if (jdoc.containsKey("DELTA_VOLTS"))
        {
            DELTA_T = jdoc["DELTA_VOLTS"];
        }
        if (jdoc.containsKey("DELTA_M_AMPS"))
        {
            DELTA_T = jdoc["DELTA_M_AMPS"];
        }
        if (jdoc.containsKey("battery_target_current"))
        {
            battery_target_current = jdoc["battery_target_current"];
        }
        if (jdoc.containsKey("battery_actual_current"))
        {
            battery_actual_current = jdoc["battery_actual_current"];
        }
        if (jdoc.containsKey("battery_target_voltage"))
        {
            battery_target_voltage = jdoc["battery_target_voltage"];
        }
        if (jdoc.containsKey("battery_actual_voltage"))
        {
            battery_actual_voltage = jdoc["battery_actual_voltage"];
        }
        if (jdoc.containsKey("oven_temperature"))
        {
            oven_temperature = jdoc["oven_temperature"];
        }
        if (jdoc.containsKey("oven_set_point"))
        {
            oven_set_point = jdoc["oven_set_point"];
        }
        if (jdoc.containsKey("comp_temperature"))
        {
            comp_temperature = jdoc["comp_temperature"];
        }
        if (jdoc.containsKey("oven_on"))
        {
            oven_on = jdoc["oven_on"];
        }
        if (jdoc.containsKey("oven_drive"))
        {
            oven_drive = jdoc["oven_drive"];
        }
        if (jdoc.containsKey("oven_drive_adjust"))
        {
            oven_drive_adjust = jdoc["oven_drive_adjust"];
        }
    }
    /* #endregion*/
}
