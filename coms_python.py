import serial
import json
import time
import warnings
import gui_layout as gui


def submit_to_arduino(data):
    json_str = json.dumps(data)
    try:
        arduino.write(json_str.encode())
    except Exception as e:
        print(e)


arduino = serial.Serial("COM6", 9600, timeout=.200, write_timeout=2)
json_data = {}


while True:
    # get data from arduino
    event, values = gui.window.read(timeout=100)
    data = arduino.readline().decode("utf-8")

    if len(data) > 0 and data[0] == '{':
        try:
            json_data = json.loads(data)
            # print()
            # print(json_data)
            gui.update_values(json_data)
        except json.decoder.JSONDecodeError as e:
            print(e)
    elif len(data) > 2:
        pass
        # print()
        # print('got data > 0 no beginning {')
        # print(data)
    gui.process_events(event, values, json_data)
    submit_to_arduino(json_data)


gui.window.close()
