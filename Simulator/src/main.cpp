#include <Arduino.h>
#include <ArduinoJson.h>
#include <time.h>
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

char receive_buffer[200];
bool serial_recieved{false};

static int DELTA_T{200};
static int DELTA_VOLTS{100};
static int DELTA_M_AMPS{100};
static volatile int battery_target_current;
static volatile int battery_set_current;
static volatile int battery_actual_current;
static volatile int battery_target_voltage;
static volatile int battery_set_voltage;
static volatile int battery_actual_voltage;
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
double oven_set_point;
double oven_temperature;
double comp_temperature;
 static int json_transmit_last_millis {0};

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

    return serializeJson(jdoc, Serial);
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println(capacity);
}

void loop() {
  // put your main code here, to run repeatedly:
  uint32_t index = 0;
  if ((millis() - json_transmit_last_millis) >= 1000)
        {
            serialize_data();
            json_transmit_last_millis = millis();
        }
    while (Serial.available())
    {
        receive_buffer[index] = Serial.read();
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
    delay(1000);
}