#include <PID_v1.h>
#include <Arduino.h>
#include <PushButtonController.h>
#include <RSLatch.h>
#include <TM1638plus.h>
#include <Adafruit_INA260.h>
#include <Adafruit_MCP4725.h>

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
#define INPUT_ON_OFF_OUT 0
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

static bool debug_print{true};

int const V_UVLO = 4500;
int const V_UVLO_HYS = 100;
int const V_TH = 5100;
int const V_BI_6V = 6981;
int const V_BI_12V = 13989;
int const I_TAPER = 312;
int const V_BOOST_6V = 7349;
int const V_BOOST_12V = 14725;
int const V_FLOAT_6V = 6825;
int const V_FLOAT_12V = 13650;
int const V_RCH_6V = 6143;
int const V_RCH_12V = 12285;
int const DEBUG_PRINT_INTERVAL = 5000;

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

struct F100B200Tester
{
    int battery_voltage;
    int battery_current;
};

F100B200Tester tester;

static State state;
static bool battery_6V;          //True = 6V battery
static bool internal;            //True = internal
static bool heat;                //True = heat
static bool manual_selected;     //True = manual_selected
static bool on_selected;         //True = on
static bool start;               //True = start
static bool setup_menu;          //True = in setup
static bool voltage_temp_select; //True = display voltage and current


static const int DELTA_T {200};
static const int DELTA_VOLTS {10};
static const int DELTA_M_AMPS {100};

static int battery_target_current;
static int battery_set_current;
static int battery_actual_current;

static int battery_target_voltage;
static int battery_set_voltage;
static int battery_actual_voltage;

static int bVolt_last_millis;
static int bAmp_last_millis;
static int debug_print_last_millis;

static int input_voltage;

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
PushButtonController Pb1(true);
PushButtonController Pb2(true);
PushButtonController Pb3(true);
PushButtonController Pb4(true);
PushButtonController Pb5(true);
PushButtonController Pb6(true);
PushButtonController Pb7(true);
PushButtonController Pb8(true);
/* #endregion*/

static char buttons;

static double oven_temperature;
static double oven_temperatures[NUMBER_OF_TEMPERATURES];
static uint8_t oven_temperatures_index;
static double oven_set_point;
static double oven_drive;
static double Kp = 2, Ki = 5, Kd = 1;
static double comp_temperature;
static double comp_temperatures[NUMBER_OF_TEMPERATURES];
static uint8_t comp_temperatures_index;

PID oven_controller(&oven_temperature, &oven_drive, &oven_set_point,
                    Kp, Ki, Kd, DIRECT);

void display_values(ulong upper_nibble, char upper_dec_point,
                    int lower_nibble, char lower_dec_point)
{

    tm.DisplayDecNumNibble(upper_nibble, lower_nibble);
}

int mVolts_to_units(int m_volts)
{
    int x = m_volts;
    x /= 0.8059;  //DAC output
    x *= 1 / 9.2; //Power amp gain
    return x;
}

int read_m_volts(uint16_t const pin_number)
{
    analogReadResolution(12);
    int mVolts = analogRead(pin_number);

    mVolts *= 812;
    mVolts /= 1000;
    return mVolts;
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
    start = false;
    
    pinMode(BATTERY_TYPE_OUT_PIN, OUTPUT);
    pinMode(INTERNA_EXTERNAL_PIN, OUTPUT);
    pinMode(HEAT_COOL_SELECT_OUT, OUTPUT);
    pinMode(INPUT_ON_OFF_OUT, OUTPUT);
 
    battery_current_out.begin(BAT_CURRENT_DAC);
    battery_voltage_out.begin(BAT_VOLTAGE_DAC);
    battery_meter.begin(BAT_METER);
    battery_meter.setAveragingCount(INA260_COUNT_64);
    battery_meter.setVoltageConversionTime(INA260_TIME_2_116_ms);
    battery_meter.setCurrentConversionTime(INA260_TIME_2_116_ms);
    
    bVolt_last_millis = millis();
    bAmp_last_millis = millis();
    debug_print_last_millis = millis();

    Serial.begin(9600);
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
     * set up menu
    ***************************************************************************/
    /*#region set up menu*/
    if ((Pb1.getState() && Pb2.getState()) == true)
        setup_menu = true;
    if (setup_menu == true)
    {
        while (!Pb8.getState() == true)
        {
            Serial.println("In setup");
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

            tm.setLED(0, on_selected);
            tm.setLED(1, manual_selected);
            tm.setLED(2, battery_6V);
            tm.setLED(3, internal);
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
        if (Pb8.r_trig() == true)
            state = PRE_CHARGE;

        if (Pb1.r_trig() == true)
        //move to previous state
        {
            Serial.println("got here line 292");
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
            }
        }
        //move to next state
        if (Pb2.r_trig() == true)
        {
            Serial.println("got here line 312");
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
            }
        }
    }
    /*#endregion*/
     
    /***************************************************************************
     * Oven temperature managment
    ***************************************************************************/
    /*#region oven temperature management*/
    // oven_temperatures[oven_temperatures_index] = read_temp(OVEN_TEMP_IN_PIN);
    // oven_temperature = 0;
    // for (int i = 0; i < NUMBER_OF_TEMPERATURES; i++)
    // {
    //     oven_temperature += oven_temperatures[i];
    // }
    // oven_temperature /= NUMBER_OF_TEMPERATURES;
    // oven_temperatures_index < NUMBER_OF_TEMPERATURES ? oven_temperatures_index++ : oven_temperatures_index = 0;
    // if (oven_controller.Compute())
    //     set_pwm(OVEN_DRIVE_PWM, oven_drive);
    /* #endregion*/
    
    /***************************************************************************
     * Component temperature management
    ***************************************************************************/
    /*#region comp temperature management*/
    // comp_temperatures[comp_temperatures_index] = read_temp(COMP_TEMP_IN_PIN);
    // comp_temperature = 0;
    // for (int i = 0; i < NUMBER_OF_TEMPERATURES; i++)
    // {
    //     comp_temperature += comp_temperatures[i];
    // }
    // comp_temperatures_index < NUMBER_OF_TEMPERATURES ? comp_temperatures_index++ : comp_temperatures_index = 0;
    // comp_temperature /= NUMBER_OF_TEMPERATURES;
    /* #endregion*/

    /***************************************************************************
     * State managment - automatic
    ***************************************************************************/
    /*#region state management*/
    // if (!manual_selected && start)
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

    switch (state)
    {
    case BULK_CHARGE:
        battery_target_voltage = battery_6V ? V_BI_6V : V_BI_12V;
        break;
    case BOOST_CHARGE:
        battery_target_voltage = battery_6V ? V_BOOST_6V : V_BOOST_12V;
        break;
    case FLOAT_CHARGE:
        battery_target_voltage = battery_6V ? V_FLOAT_6V : V_FLOAT_12V;
        break;
    default:
        battery_target_voltage = V_TH;
        break;
    }
    
    if (battery_target_voltage != battery_set_voltage)
    {
        int y = millis() - bVolt_last_millis;
        if (y > 200)
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

    battery_actual_voltage = battery_meter.readBusVoltage();
    battery_actual_current = battery_meter.readCurrent();

    if (battery_actual_current < 0)
        battery_actual_current = 0;

    battery_voltage_out.setVoltage(mVolts_to_units(battery_set_voltage), false);
    battery_current_out.setVoltage(mVolts_to_units(battery_set_current), false);
    tester.battery_voltage = battery_actual_current;
    

    /* #endregion*/

    /***************************************************************************
     * debut print 
    ***************************************************************************/
    /*#region debug print*/
    if (debug_print == true)
    {
        int x = millis() - debug_print_last_millis;
        if (x > DEBUG_PRINT_INTERVAL)
        {
            Serial.print("state:  ");
            String state_string;
            switch (state)
            {
            case PRE_CHARGE:
                state_string = "PRE_CHARGE";
                break;
            case BULK_CHARGE:
                state_string = "BULK_CHARGE";
                break;
            case BOOST_CHARGE:
                state_string = "BOOST_CHARGE";
                break;
            case FLOAT_CHARGE:
                state_string = "FLOAT_CHARGE";
                break;
            default:
                break;
            }
            Serial.println(state_string);
            Serial.print("battery_6V: ");Serial.println(battery_6V == true ?
                "True" : "False");
            Serial.print("internal: ");Serial.println(internal == true ?
                "True" : "False");
            Serial.print("heat: ");Serial.println(heat == true ?
                "True" : "False");
            Serial.print("manual_selected: ");Serial.println(manual_selected == true ?
                "True" : "False");
            Serial.print("start: ");Serial.println(start == true ?
                "True" : "False");
            Serial.print("setup_menu: ");Serial.println(setup_menu == true ?
                "True" : "False");
            Serial.print("voltage_temp_select: ");Serial.println(voltage_temp_select == true ?
                "True" : "False");
            Serial.print("debug_print: ");Serial.println(debug_print == true ?
                "True" : "False");
            Serial.print("bVolt_last_millis: ");Serial.println(bVolt_last_millis);
            Serial.print("bAmp_last_millis: ");Serial.println(bAmp_last_millis);
            Serial.print("debug_print_last_millis: ");Serial.println(debug_print_last_millis);
            Serial.print("millis(): ");Serial.println(millis());
            Serial.print("battery_target_voltage: ");
            Serial.print(battery_target_voltage);
            Serial.print(", battery_set_voltage: ");
            Serial.print(battery_set_voltage);
            Serial.print(", battery_actual_voltage: ");
            Serial.print(battery_actual_voltage);
            Serial.print(", battery_set_current: ");
            Serial.println(battery_set_current);
            Serial.println();
            debug_print_last_millis = millis();
        }
    }
    /* #endregion*/

    /***************************************************************************
     * Relay control 
    ***************************************************************************/
   /*#region Relay control*/
   digitalWrite(BATTERY_TYPE_OUT_PIN, battery_6V == true ? HIGH : LOW);
   digitalWrite(INTERNA_EXTERNAL_PIN, internal == true ? HIGH : LOW);
   digitalWrite(HEAT_COOL_SELECT_OUT, heat == true ? HIGH : LOW);
    /* #endregion*/
    /***************************************************************************
     * Display control 
    ***************************************************************************/
   /*#region Display control*/
    tm.setLED(0, on_selected);
    tm.setLED(1, manual_selected);
    tm.setLED(2, battery_6V);
    tm.setLED(3, internal);
    tm.setLED(4, state == PRE_CHARGE);
    tm.setLED(5, state == BULK_CHARGE);
    tm.setLED(6, state == BOOST_CHARGE);
    tm.setLED(7, state == FLOAT_CHARGE);

    display_values(battery_actual_voltage / 10, HUNDREDS_DECIMAL_POINT, 
        battery_actual_voltage, TENS_DECIMAL_POINT);
    /* #endregion*/
}    