import serial
import json
import time
import warnings
import PySimpleGUI as sg


def submit_to_arduino(data):
    json_str = json.dumps(data)
    try:
        arduino.write(json_str.encode())
    except Exception as e:
        print(e)


arduino = serial.Serial("COM6", 9600, timeout=.200, write_timeout=2)
json_data = {}

layout = [[sg.Text('State:'), sg.Text(size=(20, 1), key='-STATE-')],
          [sg.Text('Battery 6V:'), sg.Text(size=(20, 1), key='-BATTERY_6V-')],
          [sg.Text('Cool:'), sg.Text(size=(20, 1), key='-COOL-')],
          [sg.Text('Manual:'), sg.Text(
              size=(20, 1), key='-MANUAL_SELECTED-')],
          [sg.Text('On:'), sg.Text(size=(20, 1), key='-ON_SELECTED-')],
          [sg.Text('Start:'), sg.Text(size=(20, 1), key='-START-')],
          [sg.Text('Voltage Display:'), sg.Text(
              size=(20, 1), key='-VOLTAGE_TEMP-')],
          [sg.Text('Target Current:'), sg.Text(
              size=(20, 1), key='-TARGET_CURRENT-')],
          [sg.Text('Actual Current:'), sg.Text(
              size=(20, 1), key='-ACTUAL_CURRENT-')],
          [sg.Text('Target Voltage:'), sg.Text(
              size=(20, 1), key='-TARGET_VOLTAGE-')],
          [sg.Text('Actual Voltage:'), sg.Text(
              size=(20, 1), key='-ACTUAL_VOLTAGE-')],
          [sg.Text('Oven Temperature:'), sg.Text(
              size=(20, 1), key='-OVEN_TEMP-')],
          [sg.Text('Oven Set Point:'), sg.Text(
              size=(20, 1), key='-OVEN_SET_POINT-')],
          [sg.Text('Component Temperature:'), sg.Text(
              size=(20, 1), key='-COMP_TEMPERATURE-')],
          [sg.Radio('Display Voltage', "RADIO_VOLT_TEMP", key='-DISPLAY_VOLTAGE-', enable_events=True), sg.Radio(
              'Display Temperature', "RADIO_VOLT_TEMP", key='-DISPLAY_TEMPERATURE-', enable_events=True)],
          [sg.R('6 Volt', "RADIO_6V_12V", key="-6VOLT-", enable_events=True),
           sg.R('12 Volt', "RADIO_6V_12V", key="-12VOLT-", enable_events=True)]
          ]
window = sg.Window('F100B200 Tester', layout)


while True:
    # get data from arduino
    event, values = window.read(timeout=100)
    data = arduino.readline().decode("utf-8")

    if len(data) > 0 and data[0] == '{':
        try:
            json_data = json.loads(data)
            print()
            print('got data > 0 with beginning {')
            print(json_data)
            print()
            window['-STATE-'].update(value=json_data['state'])
            window['-BATTERY_6V-'].update(value=json_data['battery_6V'])
            window['-COOL-'].update(value=json_data['cool'])
            window['-MANUAL_SELECTED-'].update(
                value=json_data['manual_selected'])
            window['-ON_SELECTED-'].update(value=json_data['on_selected'])
            window['-START-'].update(value=json_data['start_selected'])
            window['-VOLTAGE_TEMP-'].update(
                value=json_data['voltage_temp_select'])
            window['-TARGET_CURRENT-'].update(
                value=json_data['battery_target_current'])
            window['-ACTUAL_CURRENT-'].update(
                value=json_data['battery_actual_current'])
            window['-TARGET_VOLTAGE-'].update(
                value=json_data['battery_target_voltage'])
            window['-ACTUAL_VOLTAGE-'].update(
                value=json_data['battery_actual_voltage'])
            window['-OVEN_TEMP-'].update(
                value=json_data['oven_temperature'])
            window['-OVEN_SET_POINT-'].update(
                value=json_data['oven_set_point'])
            window['-COMP_TEMPERATURE-'].update(
                value=json_data['comp_temperature'])
        except json.decoder.JSONDecodeError as e:
            print()
            print(f'Length of data: {len(data)}')
            print('jason decode error')
            print(e)
    elif len(data) > 2:
        print()
        print('got data > 0 no beginning {')
        print(data)

    if event == None:
        window.Close()
    if event == "Exit" or event == sg.WIN_CLOSED:
        break
    if event == "-SUBMIT-":
        submit_to_arduino(json_data)
    if event == "-DISPLAY_VOLTAGE-":
        json_data['voltage_temp_select'] = 1
        submit_to_arduino(json_data)
    if event == "-DISPLAY_TEMPERATURE-":
        json_data['voltage_temp_select'] = 0
        submit_to_arduino(json_data)
    if event == "-6VOLT-":
        json_data['battery_6V'] = 1
        submit_to_arduino(json_data)
    if event == "-12VOLT-":
        json_data['battery_6V'] = 0
        submit_to_arduino(json_data)

window.close()
