#include <PID_v1.h>
#include <Arduino.h>
#include <PushButtonController.h>
#include <RSLatch.h>
#include <TM1638plus.h>
#include <Adafruit_INA260.h>
#include <Adafruit_MCP4725.h>
#include <ArduinoJson.h>

//TM1638plus parameters
#define STROBE_TM 8
#define CLOCK_TM 9
#define DIO_TM 10
#define NIBBLE_SIZE 4

//I/O pin assignments
#define OVEN_TEMP_IN_PIN A0
#define COMP_TEMP_IN_PIN A1
#define HEAT_COOL_SELECT_OUT 2
#define OVEN_DRIVE_PWM 11
#define BATTERY_TYPE_OUT_PIN 3
#define INTERNA_EXTERNAL_PIN 1
#define INPUT_ON_OFF_OUT 12
#define NUMBER_OF_TEMPERATURES 5
#define NUMBER_OF_VOLTAGE_READINGS 10
#define NUMBER_OF_CURRENT_READINGS 10

//I2C addresses
#define BAT_CURRENT_DAC 0x63
#define BAT_VOLTAGE_DAC 0x62
#define BAT_METER 0x40

#define TENS_DECIMAL_POINT 2
#define HUNDREDS_DECIMAL_POINT 1
#define THOUSANDS_DECIMAL_POINT 0
#define NO_DECIMAL_POINT 3

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

TM1638plus tm(STROBE_TM, CLOCK_TM, DIO_TM);
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
const int capacity = JSON_OBJECT_SIZE(20);
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

static int DELTA_T{200};
static int DELTA_VOLTS{100};
static int DELTA_M_AMPS{100};

static volatile int battery_target_current;
static volatile int battery_set_current;
static volatile int battery_actual_current;

static volatile int battery_target_voltage;
static volatile int battery_set_voltage;
static volatile int battery_actual_voltage;

static volatile int bVolt_last_millis;
static volatile int bAmp_last_millis;
static volatile uint32_t json_transmit_last_millis;

static volatile int heart_beat_last_millis;

/* #region Push buttons*/
char const PUSHBTN1_MASK{0b00000001};
char const PUSHBTN2_MASK{0b00000010};
char const PUSHBTN3_MASK{0b00000100};
char const PUSHBTN4_MASK{0b00001000};
char const PUSHBTN5_MASK{0b00010000};
char const PUSHBTN6_MASK{0b00100000};
char const PUSHBTN7_MASK{0b01000000};
char const PUSHBTN8_MASK{0b10000000};

//create the 8 push button objects
PushButtonController Pb1(true, 50);
PushButtonController Pb2(true, 50);
PushButtonController Pb3(true, 50);
PushButtonController Pb4(true, 50);
PushButtonController Pb5(true, 50);
PushButtonController Pb6(true, 50);
PushButtonController Pb7(true, 50);
PushButtonController Pb8(true, 50);
/* #endregion*/

char buttons;

double oven_temperature;
double oven_temperatures[NUMBER_OF_TEMPERATURES];
uint8_t oven_temperatures_index;
double oven_set_point;
double oven_drive;
double Kp = 2, Ki = 5, Kd = 1;
double comp_temperature;
double comp_temperatures[NUMBER_OF_TEMPERATURES];
uint8_t comp_temperatures_index;

PID oven_controller(&oven_temperature, &oven_drive, &oven_set_point,
                    Kp, Ki, Kd, DIRECT);

void display_values(uint16_t upper_nibble, char upper_dec_point,
                    int lower_nibble, char lower_dec_point)
{

    tm.DisplayDecNumNibble(upper_nibble, lower_nibble);
}

int mVolts_to_units(int const m_volts)
{
    double x = m_volts;
    x /= 0.8059;  //DAC output
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
    jdoc["DELTA_M_AMPS"]  = DELTA_M_AMPS;
    jdoc["battery_target_current"] = battery_target_current;
    jdoc["battery_actual_current"] = battery_actual_current;
    jdoc["battery_target_voltage"] = battery_target_voltage;
    jdoc["battery_actual_voltage"] = battery_actual_voltage;
    jdoc["oven_temperature"] = oven_temperature;
    jdoc["oven_set_point"] = oven_set_point;
    jdoc["comp_temperature"] = comp_temperature;

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
    oven_controller.SetOutputLimits(0, 125);
    oven_controller.SetMode(AUTOMATIC);
    oven_temperatures_index = 0;
    comp_temperatures_index = 0;
    start_selected = false;

    pinMode(BATTERY_TYPE_OUT_PIN, OUTPUT);
    pinMode(INTERNA_EXTERNAL_PIN, OUTPUT);
    pinMode(HEAT_COOL_SELECT_OUT, OUTPUT);
    pinMode(INPUT_ON_OFF_OUT, OUTPUT);
    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(OVEN_DRIVE_PWM, OUTPUT);

    battery_current_out.begin(BAT_CURRENT_DAC);
    battery_voltage_out.begin(BAT_VOLTAGE_DAC);
    battery_meter.begin(BAT_METER);
    battery_meter.setMode(INA260_MODE_CONTINUOUS);
    battery_meter.setAveragingCount(INA260_COUNT_64);
    battery_meter.setVoltageConversionTime(INA260_TIME_2_116_ms);
    battery_meter.setCurrentConversionTime(INA260_TIME_2_116_ms);

    bVolt_last_millis = millis();
    bAmp_last_millis = millis();
    json_transmit_last_millis = millis();
    heart_beat_last_millis = millis();

    SerialUSB.begin(9600);
    tm.displayBegin();
}
void loop()
{
    /* #region Update push buttons*/
    buttons = tm.readButtons();
    Pb1.update(buttons & PUSHBTN1_MASK);
    Pb2.update(buttons & PUSHBTN2_MASK);
    Pb3.update(buttons & PUSHBTN3_MASK);
    Pb4.update(buttons & PUSHBTN4_MASK);
    Pb5.update(buttons & PUSHBTN5_MASK);
    Pb6.update(buttons & PUSHBTN6_MASK);
    Pb7.update(buttons & PUSHBTN7_MASK);
    Pb8.update(buttons & PUSHBTN8_MASK);
    /* #endregion*/

    /***************************************************************************
     * push button set up menu
    ***************************************************************************/
    /*#region set up menu*/
    if ((Pb1.getState() && Pb2.getState()) == true)
        setup_menu = true;
    if (setup_menu == true)
    {
        while (!Pb8.getState() == true)
        {
            delay(500);
            buttons = tm.readButtons();
            Pb1.update(buttons & PUSHBTN1_MASK);
            Pb2.update(buttons & PUSHBTN2_MASK);
            Pb3.update(buttons & PUSHBTN3_MASK);
            Pb4.update(buttons & PUSHBTN4_MASK);
            Pb5.update(buttons & PUSHBTN5_MASK);
            Pb6.update(buttons & PUSHBTN6_MASK);
            Pb7.update(buttons & PUSHBTN7_MASK);
            Pb8.update(buttons & PUSHBTN8_MASK);

            if (Pb1.r_trig())
                on_selected = !on_selected;
            if (Pb2.r_trig())
                manual_selected = !manual_selected;
            if (Pb3.r_trig())
                battery_6V = !battery_6V;
            if (Pb4.r_trig())
                internal = !internal;
            if (Pb5.r_trig())
                voltage_temp_select = !voltage_temp_select;

            tm.setLED(0, on_selected);
            tm.setLED(1, manual_selected);
            tm.setLED(2, battery_6V);
            tm.setLED(3, internal);
            tm.setLED(4, voltage_temp_select);
            SerialUSB.print("manual_selected: ");
            SerialUSB.println(manual_selected == true ? "True" : "False");
        }
        setup_menu = false;
    }
    /* #endregion*/

    /***************************************************************************
     * manual_selected operation menu
    ***************************************************************************/
    /*#region manual_selected operation*/

    if (manual_selected == true)
    {
        if (Pb1.r_trig() == true)
        //move to previous state
        {
            switch (state)
            {
            case PRE_CHARGE:
                state = FLOAT_CHARGE;
                break;
            case FLOAT_CHARGE:
                state = BOOST_CHARGE;
                break;
            case BOOST_CHARGE:
                state = BULK_CHARGE;
                break;
            case BULK_CHARGE:
                state = PRE_CHARGE;
                break;
            case UV_LOCKED:
                state = PRE_CHARGE;
                break;
            }
        }
        //move to next state
        if (Pb2.r_trig() == true)
        {
            switch (state)
            {
            case PRE_CHARGE:
                state = BULK_CHARGE;
                break;
            case BULK_CHARGE:
                state = BOOST_CHARGE;
                break;
            case BOOST_CHARGE:
                state = FLOAT_CHARGE;
                break;
            case FLOAT_CHARGE:
                state = PRE_CHARGE;
                break;
            case UV_LOCKED:
                state = PRE_CHARGE;
                break;
            }
        }
    }
    /*#endregion*/

    /***************************************************************************
     * Oven temperature managment
    ***************************************************************************/
    /*#region oven temperature management*/
    oven_temperatures[oven_temperatures_index] = read_temp(OVEN_TEMP_IN_PIN);
    oven_temperature = 0;
    for (int i = 0; i < NUMBER_OF_TEMPERATURES; i++)
    {
        oven_temperature += oven_temperatures[i];
    }
    oven_temperature /= NUMBER_OF_TEMPERATURES;
    oven_temperatures_index < NUMBER_OF_TEMPERATURES ? oven_temperatures_index++ : oven_temperatures_index = 0;
    if (oven_controller.Compute())
    {
        set_pwm(OVEN_DRIVE_PWM, oven_drive);
    }
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

    /***************************************************************************
     * State managment - automatic
    ***************************************************************************/
    /*#region state management*/
    // if (!manual_selected && start_selected)
    // {
    //     switch (state)
    //     {
    //     case UV_LOCKED:
    //         if (input_voltage > V_UVLO)
    //         {
    //             state = PRE_CHARGE;
    //         }
    //         break;
    //     case PRE_CHARGE:
    //         if (input_voltage < (V_UVLO - V_UVLO_HYS))
    //         {
    //             state = UV_LOCKED;
    //         }
    //         else if (battery_actual_voltage > V_TH)
    //         {
    //             state = BULK_CHARGE;
    //         }
    //         break;
    //     case BULK_CHARGE:
    //         if (input_voltage < (V_UVLO - V_UVLO_HYS))
    //         {
    //             state = UV_LOCKED;
    //         }
    //         else if (battery_actual_voltage >
    //                  (battery_6V ? V_BI_6V : V_BI_12V))
    //         {
    //             state = BOOST_CHARGE;
    //         }
    //     case BOOST_CHARGE:
    //         if (input_voltage < (V_UVLO - V_UVLO_HYS))
    //         {
    //             state = UV_LOCKED;
    //         }
    //         else if (battery_actual_current < I_TAPER)
    //         {
    //             state = FLOAT_CHARGE;
    //         }
    //     default:
    //         break;
    //     }
    // }
    // /* #endregion*/

    // /***************************************************************************
    //  * Battery voltage / current management
    // ***************************************************************************/
    /*#region battery voltage and current management*/

    if (manual_selected)
    {
        switch (state)
        {
        case BULK_CHARGE:
            battery_target_voltage = battery_6V ? V_BI_6V : V_BI_12V;
            battery_target_current = 2000;
            break;
        case BOOST_CHARGE:
            battery_target_voltage = battery_6V ? V_BOOST_6V : V_BOOST_12V;
            battery_target_current = 2000;
            break;
        case FLOAT_CHARGE:
            battery_target_voltage = battery_6V ? V_FLOAT_6V : V_FLOAT_12V;
            battery_target_current = 100;
            break;
        default:
            battery_target_voltage = V_TH;
            battery_target_current = 2000;
            break;
        }
    }
    if (battery_target_voltage != battery_set_voltage)
    {
        int y = millis() - bVolt_last_millis;
        if (y > DELTA_T)
        {
            int x = battery_target_voltage - battery_set_voltage;
            if (x > 0)
            {
                battery_set_voltage += (x > DELTA_VOLTS) ? DELTA_VOLTS : x;
            }
            else
            {
                battery_set_voltage -= (abs(x) > DELTA_VOLTS) ? DELTA_VOLTS : abs(x);
            }
            bVolt_last_millis = millis();
        }
    }
    if (battery_target_current != battery_set_current)
    {
        int y = millis() - bAmp_last_millis;
        if (y > DELTA_T)
        {
            int x = battery_target_current - battery_set_current;
            if (x > 0)
            {
                battery_set_current += (y > DELTA_M_AMPS) ? DELTA_M_AMPS : y;
            }
            else
            {
                battery_set_current -= (abs(y) > DELTA_M_AMPS) ? DELTA_M_AMPS : abs(x);
            }
            bAmp_last_millis = millis();
        }
    }

    battery_actual_voltage = battery_meter.readBusVoltage();
    battery_actual_current = battery_meter.readCurrent();

    if (battery_actual_current < 0)
        battery_actual_current = 0;

    battery_voltage_out.setVoltage(mVolts_to_units(battery_set_voltage), false);
    battery_current_out.setVoltage(mAmps_to_units(battery_set_current), false);

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
     * Relay control 
    ***************************************************************************/
    /*#region Relay control*/
    cool = false;

    digitalWrite(BATTERY_TYPE_OUT_PIN, battery_6V == true ? HIGH : LOW);
    digitalWrite(INTERNA_EXTERNAL_PIN, internal == true ? HIGH : LOW);
    digitalWrite(HEAT_COOL_SELECT_OUT, cool == true ? HIGH : LOW);
    digitalWrite(INPUT_ON_OFF_OUT, on_selected == true ? HIGH : LOW);

    /* #endregion*/
    /***************************************************************************
     * Display control 
    ***************************************************************************/
    /*#region Display control*/

    if (Pb7.r_trig())
        voltage_temp_select = !voltage_temp_select;

    if (voltage_temp_select == true)
    {
        display_values(battery_actual_voltage / 10, HUNDREDS_DECIMAL_POINT,
                       battery_actual_current, TENS_DECIMAL_POINT);
    }
    else
    {
        display_values(comp_temperature, TENS_DECIMAL_POINT,
                       oven_temperature, TENS_DECIMAL_POINT);
    }

    tm.setLED(0, on_selected);
    tm.setLED(1, manual_selected);
    tm.setLED(2, battery_6V);
    tm.setLED(3, internal);
    tm.setLED(4, state == PRE_CHARGE);
    tm.setLED(5, state == BULK_CHARGE);
    tm.setLED(6, state == BOOST_CHARGE);
    tm.setLED(7, state == FLOAT_CHARGE);

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
    }
    /* #endregion*/
}
