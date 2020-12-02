import PySimpleGUI as sg


# region Readings Tab
readings_tab = [[sg.Text('State:'), sg.Text(size=(20, 1), key='-STATE-')],
                [sg.Text('Battery 6V:'), sg.Text(
                    size=(20, 1), key='-BATTERY_6V-')],
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
# endregion
# region Manual Tab
manual_tab = [[sg.R('6 Volt', "RADIO_6V_12V", key="-6VOLT-", enable_events=True),
               sg.R('12 Volt', "RADIO_6V_12V", key="-12VOLT-", enable_events=True)],
              [sg.R('ON ', "RADIO_ON_OFF", key="-ON-", enable_events=True),
               sg.R('OFF', "RADIO_ON_OFF", key="-OFF-", enable_events=True)],
              [sg.R('MAN ', "RADIO_MAN_AUTO", key="-MANUAL-", enable_events=True),
               sg.R('AUTO', "RADIO_MAN_AUTO", key="-AUTO-", enable_events=True)]
              ]

main_layout = [[sg.TabGroup([[
    sg.Tab('Readings', readings_tab),
    sg.Tab('Manual', manual_tab)
]])]]
# endregion
# region Update GUI Values


def update_values(json_data):

    if 'state' in json_data:
        window['-STATE-'].update(value=json_data['state'])
    if 'battery_6V' in json_data:
        window['-BATTERY_6V-'].update(value=json_data['battery_6V'])
    if 'cool' in json_data:
        window['-COOL-'].update(value=json_data['cool'])
    if 'manual_selected' in json_data:
        window['-MANUAL_SELECTED-'].update(
            value=json_data['manual_selected'])
    if 'on_selected' in json_data:
        window['-ON_SELECTED-'].update(value=json_data['on_selected'])
    if 'start_selected' in json_data:
        window['-START-'].update(value=json_data['start_selected'])
    if 'voltage_temp_select' in json_data:
        window['-VOLTAGE_TEMP-'].update(
            value=json_data['voltage_temp_select'])
    if 'battery_target_current' in json_data:
        window['-TARGET_CURRENT-'].update(
            value=json_data['battery_target_current'])
    if 'battery_actual_current' in json_data:
        window['-ACTUAL_CURRENT-'].update(
            value=json_data['battery_actual_current'])
    if 'battery_target_voltage' in json_data:
        window['-TARGET_VOLTAGE-'].update(
            value=json_data['battery_target_voltage'])
    if 'battery_actual_voltage' in json_data:
        window['-ACTUAL_VOLTAGE-'].update(
            value=json_data['battery_actual_voltage'])
    if 'oven_temperature' in json_data:
        window['-OVEN_TEMP-'].update(
            value=json_data['oven_temperature'])
    if 'oven_set_point' in json_data:
        window['-OVEN_SET_POINT-'].update(
            value=json_data['oven_set_point'])
    if 'comp_temperature' in json_data:
        window['-COMP_TEMPERATURE-'].update(
            value=json_data['comp_temperature'])
    if 'on_selected' in json_data:
        if json_data['on_selected']:
            window['-ON-'].update(True)
        else:
            window['-OFF-'].update(True)
    if 'battery_6V' in json_data:
        if json_data['battery_6V']:
            window['-6VOLT-'].update(True)
        else:
            window['-12VOLT-'].update(True)
    if 'voltage_temp_select' in json_data:
        if json_data['voltage_temp_select']:
            window['-DISPLAY_VOLTAGE-'].update(True)
        else:
            window['-DISPLAY_TEMPERATURE-'].update(True)
    if 'manual_selected' in json_data:
        if json_data['manual_selected']:
            window['-MANUAL-'].update(True)
        else:
            window['-AUTO-'].update(True)
# endregion
# region Process Events


def process_events(event, values, json_data):
    if event == None:
        return False
    if event == "Exit" or event == sg.WIN_CLOSED:
        return False
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
    return True


# endregion
window = sg.Window('F100B200 Tester', main_layout)
