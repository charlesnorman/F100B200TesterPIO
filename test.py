import PySimpleGUI as sg
sg.theme('dark')

layout = []
for i in range(1, 7):
    layout += [sg.T(f'Task-{i}'), sg.I(key=f'-IN-{i}')],
layout += [[sg.OK(), sg.Cancel()]]

window = sg.Window('Tasks', layout)

event, values = window.read()
window.close()
print(event, values)
