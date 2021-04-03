import arduino_serial
import GUI
import GUI_support
import tkinter as tk
import tkinter.ttk as ttk
import sys
import json
import time
import threading
import queue
import serial


def menu_exit():
    sys.exit()


arduino = arduino_serial.get_arduino_native_USB()


class App():
    data_to_arduino = {}

    def __init__(self, master) -> None:

        master.title("Tester App")
        master.geometry("300x300")

        menubar = tk.Menu(master)

        # Adding File Menu and commands
        file = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label='File', menu=file)
        file.add_separator()
        file.add_command(label='Exit', command=menu_exit)

        # Adding Tester Menu and commands
        edit = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label='Tester', menu=edit)
        #edit.add_command(label='Main', command=menu_main)

        # Adding Help Menu
        help_ = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label='Help', menu=help_)
        help_.add_command(label='About F100B200 Tester', command=None)

        # display Menu
        master.config(menu=menubar)

        GUI.create_Toplevel1(master)
        GUI_support.battery_target_current.set(0)
        GUI_support.battery_target_voltage.set(0)
        # start the arduino read
        self.get_arduino()

    def get_arduino(self):
        data = arduino_serial.get_json_data(arduino)
        print(data)
        if data:
            if "battery_actual_current" in data:
                GUI_support.battery_actual_current.set(
                    str(data["battery_actual_current"]))
            if "battery_actual_voltage" in data:
                GUI_support.battery_actual_voltage.set(
                    str(data["battery_actual_voltage"]))
            if "oven_temperature" in data:
                GUI_support.oven_temperature.set(data["oven_temperature"])
            if "comp_temperature" in data:
                GUI_support.comp_temperature.set(data["comp_temperature"])
            if "stat_1" in data:
                GUI_support.stat_1.set(str(data["stat_1"]))
            if "stat_2" in data:
                GUI_support.stat_2.set(str(data["stat_2"]))
            if "power_on_not" in data:
                if data["power_on_not"] == "False":
                    GUI_support.power_on_not.set("True")
                else:
                    GUI_support.power_on_not.set("False")
            if "plus_load" in data:
                GUI_support.plus_load.set(str(data["plus_load"]))

        self.data_to_arduino["on_selected"] = GUI_support.on_selected.get()
        self.data_to_arduino["cool"] = GUI_support.cool.get()
        self.data_to_arduino["battery_6V"] = GUI_support.battery_6V.get()
        self.data_to_arduino["internal"] = GUI_support.internal.get()
        self.data_to_arduino["oven_on"] = GUI_support.oven_on.get()
        try:
            self.data_to_arduino["battery_target_voltage"] = float(GUI_support.battery_target_voltage.get(
            ))
        except:
            pass

        arduino_serial.submit_to_arduino(arduino, self.data_to_arduino)
        root.after(300, self.get_arduino)


root = tk.Tk()


App(root)
root.mainloop()
