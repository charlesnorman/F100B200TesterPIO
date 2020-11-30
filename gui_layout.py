import PySimpleGUI as sg

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
          [sg.Radio('Display Volts', "RADIO_VOLT_TEMP", key='-DISPLAY_VOLTAGE-', enable_events=True), sg.Radio(
              'Display Temp(C)', "RADIO_VOLT_TEMP", key='-DISPLAY_TEMPERATURE-', enable_events=True)],
          [sg.R('6 Volt', "RADIO_6V_12V", key="-6VOLT-", enable_events=True),
           sg.R('12 Volt', "RADIO_6V_12V", key="-12VOLT-", enable_events=True)],
          [sg.R('ON ', "RADIO_ON_OFF", key="-ON-", enable_events=True),
           sg.R('OFF', "RADIO_ON_OFF", key="-OFF-", enable_events=True)],
          [sg.R('MAN ', "RADIO_MAN_AUTO", key="-MANUAL-", enable_events=True),
           sg.R('AUTO', "RADIO_MAN_AUTO", key="-AUTO-", enable_events=True)]
          ]
window = sg.Window('F100B200 Tester', layout)


def update_values(data):
    window['-STATE-'].update(value=data['state'])
    window['-BATTERY_6V-'].update(value=data['battery_6V'])
    window['-COOL-'].update(value=data['cool'])
    window['-MANUAL_SELECTED-'].update(
        value=data['manual_selected'])
    window['-ON_SELECTED-'].update(value=data['on_selected'])
    window['-START-'].update(value=data['start_selected'])
    window['-VOLTAGE_TEMP-'].update(
        value=data['voltage_temp_select'])
    window['-TARGET_CURRENT-'].update(
        value=data['battery_target_current'])
    window['-ACTUAL_CURRENT-'].update(
        value=data['battery_actual_current'])
    window['-TARGET_VOLTAGE-'].update(
        value=data['battery_target_voltage'])
    window['-ACTUAL_VOLTAGE-'].update(
        value=data['battery_actual_voltage'])
    window['-OVEN_TEMP-'].update(
        value=data['oven_temperature'])
    window['-OVEN_SET_POINT-'].update(
        value=data['oven_set_point'])
    window['-COMP_TEMPERATURE-'].update(
        value=data['comp_temperature'])
    if(data['on_selected']):
        window['-ON-'].update(True)
    else:
        window['-OFF-'].update(True)
    if(data['battery_6V']):
        window['-6VOLT-'].update(True)
    else:
        window['-12VOLT-'].update(True)
    if(data['voltage_temp_select']):
        window['-DISPLAY_VOLTAGE-'].update(True)
    else:
        window['-DISPLAY_TEMPERATURE-'].update(True)
    if(data['manual_selected']):
        window['-MANUAL-'].update(True)
    else:
        window['-AUTO-'].update(True)


def process_events(event, values, json_data):
    if event == None:
        window.Close()
    if event == "Exit" or event == sg.WIN_CLOSED:
        window.Close()
    if event == "-DISPLAY_VOLTAGE-":
        json_data['voltage_temp_select'] = 1
    if event == "-DISPLAY_TEMPERATURE-":
        json_data['voltage_temp_select'] = 0
    if event == "-6VOLT-":
        json_data['battery_6V'] = 1
    if event == "-12VOLT-":
        json_data['battery_6V'] = 0
    if event == "-ON-":
        json_data['on_selected'] = 1
    if event == "-OFF-":
        json_data['on_selected'] = 0
