import serial
import json
import time
arduino = serial.Serial("COM4", 9600, timeout=.100)
time.sleep(2)

while True:
    data = arduino.readlines()
    test_station_data = {}
    if data:
        decoded_data = data[0].decode("utf-8")
        print(f"data is type {type(data)}")
        print(f"data[0] is type {type(data[0])}")
        if decoded_data[0] == "{":
            test_station_data = json.loads(decoded_data)
            print(f'test_station_data is type {type(test_station_data)}')
            for k, v in test_station_data.items():
                print(f'{k} = {v}')
        print(f'battery_6V = {test_station_data.get("battery_6V", "none")}')
