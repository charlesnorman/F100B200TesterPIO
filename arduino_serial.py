import serial
import serial.tools.list_ports
import json
from json.decoder import JSONDecodeError
import time
import warnings
import sys


def submit_to_arduino(port, data):
    """Write data to an arduino port. """

    json_str = json.dumps(data)
    try:
        port.write(json_str.encode())
    except Exception as e:
        print(e)


def open_arduino_serial():
    """Query com ports and return list of arduino ports."""
    due_ports = []
    for p in serial.tools.list_ports.comports():
        if int(p.vid) == 9025:
            due_ports.append(p)
    if not due_ports:
        return
    return due_ports


def get_json_data(port):
    """Get json doc from arduino."""
    valid_data = False
    data = port.readline().decode("utf-8")
    try:
        json_data = json.loads(data)
        valid_data = True
    except JSONDecodeError as e:
        valid_data = False

    if valid_data:
        return json_data
    else:
        return


def get_arduino_native_USB():
    ports = open_arduino_serial()
    found_arduino_port = False
    for p in ports:
        if int(p.pid) == 62:
            arduino_port = p
            found_arduino_port = True

    if found_arduino_port:
        try:

            arduino = serial.Serial(arduino_port.device,
                                    9600, timeout=.2, write_timeout=2)
        except:

            print(sys.exc_info()[0])
            exit()
    return arduino
