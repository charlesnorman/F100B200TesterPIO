import PySimpleGUI as sg

# region Functions


def LEDIndicator(key=None, radius=30):
    return sg.Graph(canvas_size=(radius, radius),
                    graph_bottom_left=(-radius, -radius),
                    graph_top_right=(radius, radius),
                    pad=(0, 0), key=key)


def SetLED(window, key, color):
    graph = window[key]
    graph.erase()
    graph.draw_circle((0, 0), 12, fill_color=color, line_color=color)


# endregion
# region LED Panel
LED_layout = [sg.Text('  Stat 1'), LEDIndicator('-STAT_1_LED-'),
              sg.Text('  Stat 2'), LEDIndicator('-STAT_2_LED-'),
              sg.Text('  Power On'), LEDIndicator('-POWER_ON_LED-'),
              sg.Text('  Load'), LEDIndicator('-PLUS_LOAD_LED-')
              ]
# endregion
# region Readings Tab
readings_tab = [[sg.Text('State:'), sg.Text(size=(20, 1), key='-STATE-')],
                [sg.Text('Battery 6V:'), sg.Text(
                    size=(20, 1), key='-BATTERY_6V-')],
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
                    size=(20, 1), key='-ACTUAL_VOLTAGE-')]
                ]
# endregion
# region Settings Tab
settings_tab = [
    [sg.Radio('Display Volts', "RADIO_VOLT_TEMP", key='-DISPLAY_VOLTAGE-',
              enable_events=True), sg.Radio(
        'Display Temp(C)', "RADIO_VOLT_TEMP", key='-DISPLAY_TEMPERATURE-',
        enable_events=True)],
    [sg.R('6 Volt', "RADIO_6V_12V", key="-6VOLT-", enable_events=True),
     sg.R('12 Volt', "RADIO_6V_12V", key="-12VOLT-", enable_events=True)],
    [sg.R('ON ', "RADIO_ON_OFF", key="-ON-", enable_events=True),
     sg.R('OFF', "RADIO_ON_OFF", key="-OFF-", enable_events=True)],
    [sg.R('MAN ', "RADIO_MAN_AUTO", key="-MANUAL-", enable_events=True),
     sg.R('AUTO', "RADIO_MAN_AUTO", key="-AUTO-", enable_events=True)],
    [sg.R('INTERNAL ', "RADIO_INT_EXT", key="-INTERNAL-", enable_events=True),
     sg.R('EXTERNAL', "RADIO_INT_EXT", key="-EXTERNAL-", enable_events=True)]

]
# endregion
# region Oven Tab
oven_tab = [
    [sg.R('OVEN-ON ', "OVEN", key="-OVEN_ON-", enable_events=True),
     sg.R('OVEN-OFF', "OVEN", key="-OVEN_OFF-", enable_events=True)],
    [sg.R('COOL ', "COOL_HEAT", key="-COOL-", enable_events=True),
     sg.R('HEAT', "COOL_HEAT", key="-HEAT-", enable_events=True)],
    [sg.Text('Oven Temperature:'), sg.Text(
        size=(20, 1), key='-OVEN_TEMP-')],
    [sg.Text('Oven Set Point:'), sg.Text(
        size=(20, 1), key='-OVEN_SET_POINT-'),
        sg.Input(size=(10, 1), tooltip="Enter new Set point", justification='right',
                 key="-NEW_OVEN_SETPOINT-", enable_events=True)],
    [sg.Text('Component Temperature:'), sg.Text(
        size=(20, 1), key='-COMP_TEMPERATURE-')],
    [sg.Text('Oven Drive:'), sg.Text(
        size=(20, 1), key='-OVEN_DRIVE-')],
    [sg.Text('Oven Drive Adjust:'), sg.Text(
        size=(20, 1), key='-OVEN_DRIVE_ADJUST-')]
]

# endregion
# region Manual Tab
# --- Define the Compound Element. Has 2 buttons and an input field --- #
charge_cable_resistance = 0.07

voltage_spinner = [sg.Text('Adjust Value: '),
                   sg.Input('0', size=(10, 1), font='Any 12',
                            justification='r', key='-MAN_TARGET_INPUT-', tooltip='This value will be added to target voltage'),
                   sg.Column([
                       [sg.Button('▲', size=(1, 1), font='Any 7', border_width=0, button_color=(
                           sg.theme_text_color(), sg.theme_background_color()), key='-INCREASE_VOLTS-'), ],
                       [sg.Button('▼', size=(1, 1), font='Any 7', border_width=0, button_color=(sg.theme_text_color(), sg.theme_background_color()), key='-DECREASE_VOLTS-')]]),
                   sg.Text('  Step Value: '),
                   sg.Input('', size=(10, 1), key='-STEP_VALUE-',
                            tooltip='Enter step value here', justification='r')
                   ]
manual_tab = [
    [sg.Frame('Manual Target Voltage Adjust: ', [
        voltage_spinner,
        [sg.Text('Battery Target Voltage                   '), sg.Text('         ',
                                                                       size=(
                                                                           10, 1),
                                                                       key='-NOW_TARGET_VOLTAGE-', background_color='white', text_color='black')],
        [sg.Text('Actual Battery Voltage                   '), sg.Text('         ',
                                                                       size=(
                                                                           10, 1),
                                                                       key='-NOW_VOLTAGE-', background_color='white', text_color='black')],
        [sg.Text('Charger Volts                               '), sg.Text('          ', size=(
            10, 1), key='-CHARGER_VOLTS-', background_color='white', text_color='black')],
        [sg.Text('Acutal Battery Current                   '), sg.Text('          ', size=(
            10, 1), key='-NOW_CURRENT-', background_color='white', text_color='black')],

        [sg.B("Submit", key="-SUBMIT_MAN_TARGET_VOLT-")]])]
]
# endregion
# region Main Layout

main_layout = [
    LED_layout,
    [sg.TabGroup([[
        sg.Tab('Readings', readings_tab),
        sg.Tab('Settings', settings_tab),
        sg.Tab("Manual Voltage", manual_tab),
        sg.Tab("Oven", oven_tab)
    ]])]]
# endregion
# region Update GUI Values


def update_values(json_data):

    if 'state' in json_data:
        window['-STATE-'].update(value=json_data['state'])
    if 'battery_6V' in json_data:
        window['-BATTERY_6V-'].update(value=json_data['battery_6V'])
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
        window['-NOW_CURRENT-'].update(
            value=json_data['battery_actual_current'])
    if 'battery_target_voltage' in json_data:
        window['-TARGET_VOLTAGE-'].update(
            value=json_data['battery_target_voltage'])
        window['-NOW_TARGET_VOLTAGE-'].update(
            value=json_data['battery_target_voltage'])
    if 'battery_actual_voltage' in json_data:
        window['-ACTUAL_VOLTAGE-'].update(
            value=json_data['battery_actual_voltage'])
        window['-NOW_VOLTAGE-'].update(
            value=json_data['battery_actual_voltage'])
    if 'oven_temperature' in json_data:
        window['-OVEN_TEMP-'].update(
            value=json_data['oven_temperature'])
    if 'oven_set_point' in json_data:
        window['-OVEN_SET_POINT-'].update(
            value=json_data['oven_set_point'])
    if 'oven_drive' in json_data:
        window['-OVEN_DRIVE-'].update(
            value=json_data['oven_drive'])
    if 'oven_drive_adjust' in json_data:
        window['-OVEN_DRIVE_ADJUST-'].update(
            value=json_data['oven_drive_adjust'])
    if 'comp_temperature' in json_data:
        window['-COMP_TEMPERATURE-'].update(
            value=json_data['comp_temperature'])
    if 'oven_on' in json_data:
        if json_data['oven_on']:
            window['-OVEN_ON-'].update(True)
        else:
            window['-OVEN_OFF-'].update(True)
    if 'cool' in json_data:
        if json_data['cool']:
            window['-COOL-'].update(True)
        else:
            window['-HEAT-'].update(True)
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
    if 'internal' in json_data:
        if json_data['internal']:
            window['-INTERNAL-'].update(True)
        else:
            window['-EXTERNAL-'].update(True)
    if 'battery_actual_current' in json_data and 'battery_actual_voltage' in json_data:
        window['-CHARGER_VOLTS-'].update(json_data['battery_actual_voltage'] +
                                         (json_data['battery_actual_current'] * charge_cable_resistance))
    if 'stat_1' in json_data:
        if json_data['stat_1']:
            SetLED(window, '-STAT_1_LED-', 'green')
        else:
            SetLED(window, '-STAT_1_LED-', 'red')
    if 'stat_2' in json_data:
        if json_data['stat_2']:
            SetLED(window, '-STAT_2_LED-', 'green')
        else:
            SetLED(window, '-STAT_2_LED-', 'red')
    if 'power_on_not' in json_data:
        if json_data['power_on_not']:
            SetLED(window, '-POWER_ON_LED-', 'green')
        else:
            SetLED(window, '-POWER_ON_LED-', 'red')
    if 'plus_load' in json_data:
        if json_data['plus_load']:
            SetLED(window, '-PLUS_LOAD_LED-', 'green')
        else:
            SetLED(window, '-PLUS_LOAD_LED-', 'red')


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
    if event == "-SUBMIT_MAN_TARGET_VOLT-":
        temp = (int(json_data['battery_target_voltage']) +
                int(window['-MAN_TARGET_INPUT-'].get()))
        json_data['battery_target_voltage'] = temp
        print(json_data['battery_target_voltage'])
    if event == "-INCREASE_VOLTS-":
        window['-MAN_TARGET_INPUT-'].update(
            int(window['-MAN_TARGET_INPUT-'].get()) + int(window['-STEP_VALUE-'].get()))
    if event == '-DECREASE_VOLTS-':
        window['-MAN_TARGET_INPUT-'].update(
            int(window['-MAN_TARGET_INPUT-'].get()) - int(window['-STEP_VALUE-'].get()))
    if event == '-NEW_OVEN_SETPOINT-':
        try:
            json_data["oven_set_point"] = int(
                window['-NEW_OVEN_SETPOINT-'].get())
        except:
            json_data["oven_set_point"] = 0

    if event == "-INTERNAL-":
        json_data['internal'] = 1
    if event == "-EXTERNAL-":
        json_data['internal'] = 0
    if event == "-OVEN_ON-":
        json_data['oven_on'] = 1
    if event == "-OVEN_OFF-":
        json_data['oven_on'] = 0
    if event == "-COOL-":
        json_data['cool'] = 1
    if event == "-HEAT-":
        json_data['cool'] = 0
    return True


# endregion
window = sg.Window('F100B200 Tester', main_layout)
