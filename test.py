import warnings
import serial
import serial.tools.list_ports

arduino_ports = [
    p.device
    for p in serial.tools.list_ports.comports()
    # may need tweaking to match new arduinos
    if ('Arduino' in p.description and not "Programming" in p.description)
]
if not arduino_ports:
    raise IOError("No Arduino found")
if len(arduino_ports) == 1:
    arduino = arduino_ports[0]

if len(arduino_ports) > 1:
    warnings.warn('Multiple Arduinos found - using the first')
    arduino = arduino_ports[0]

print(arduino)
