Thanos_INA260
===============

INA260 Current Sensor library for Arduino


 Some functions are missing, but it can measure the voltage and the current perfectly. 
 I used the TI's evaluation board for testing: https://youtu.be/8NWVv__e6lM



<!-- START COMPATIBILITY TABLE -->

## Compatibility

MCU               | Tested Works | Doesn't Work | Not Tested  | Notes
----------------- | :----------: | :----------: | :---------: | -----
Atmega328 @ 16MHz |              |             |     X      | 
Atmega328 @ 12MHz |              |             |     X      | 
Atmega32u4 @ 16MHz |              |             |     X      | 
Atmega32u4 @ 8MHz |              |             |     X      | 
ESP8266           |              |             |     X      | 
Atmega2560 @ 16MHz |              |             |     X      | 
ATSAM3X8E         |      X       |             |            | Use D20/D21.
ATSAM21D          |      X       |             |            | 
ATtiny85 @ 16MHz  |             |             |     X       | 
ATtiny85 @ 8MHz   |             |             |     X       | 

  * ATmega328 @ 16MHz : Arduino UNO, Adafruit Pro Trinket 5V, Adafruit Metro 328, Adafruit Metro Mini
  * ATmega328 @ 12MHz : Adafruit Pro Trinket 3V
  * ATmega32u4 @ 16MHz : Arduino Leonardo, Arduino Micro, Arduino Yun, Teensy 2.0
  * ATmega32u4 @ 8MHz : Adafruit Flora, Bluefruit Micro
  * ESP8266 : Adafruit Huzzah
  * ATmega2560 @ 16MHz : Arduino Mega
  * ATSAM3X8E : Arduino Due
  * ATSAM21D : Arduino Zero, M0 Pro
  * ATtiny85 @ 16MHz : Adafruit Trinket 5V
  * ATtiny85 @ 8MHz : Adafruit Gemma, Arduino Gemma, Adafruit Trinket 3V

<!-- END COMPATIBILITY TABLE -->
