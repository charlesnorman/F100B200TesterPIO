EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L F100B200TestPanel:ControlBoard U?
U 1 1 5F505F35
P 6450 2500
F 0 "U?" H 6025 3115 50  0000 C CNN
F 1 "ControlBoard" H 6025 3024 50  0000 C CNN
F 2 "" H 6250 2500 50  0001 C CNN
F 3 "" H 6250 2500 50  0001 C CNN
	1    6450 2500
	1    0    0    -1  
$EndComp
Text Label 1150 950  2    50   ~ 0
110VAC_L
Text Label 1150 1050 2    50   ~ 0
GND
Text Label 1150 1150 2    50   ~ 0
110VAC_N
$Comp
L power:GND #PWR?
U 1 1 5F50CB67
P 1250 1050
F 0 "#PWR?" H 1250 800 50  0001 C CNN
F 1 "GND" V 1255 922 50  0000 R CNN
F 2 "" H 1250 1050 50  0001 C CNN
F 3 "" H 1250 1050 50  0001 C CNN
	1    1250 1050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 1050 1250 1050
$Comp
L Switch:SW_SPST SW?
U 1 1 5F50DB2D
P 1750 950
F 0 "SW?" H 1750 1185 50  0000 C CNN
F 1 "SW_SPST" H 1750 1094 50  0000 C CNN
F 2 "" H 1750 950 50  0001 C CNN
F 3 "~" H 1750 950 50  0001 C CNN
	1    1750 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 950  1550 950 
$Comp
L Device:Transformer_1P_2S T?
U 1 1 5F50E958
P 2700 1150
F 0 "T?" H 2700 1731 50  0000 C CNN
F 1 "Transformer_1P_2S" H 2700 1640 50  0000 C CNN
F 2 "" H 2700 1150 50  0001 C CNN
F 3 "~" H 2700 1150 50  0001 C CNN
	1    2700 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:Transformer_1P_2S T?
U 1 1 5F5109B5
P 2700 2300
F 0 "T?" H 2700 2881 50  0000 C CNN
F 1 "Transformer_1P_2S" H 2700 2790 50  0000 C CNN
F 2 "" H 2700 2300 50  0001 C CNN
F 3 "~" H 2700 2300 50  0001 C CNN
	1    2700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 950  2150 950 
Wire Wire Line
	2150 950  2150 2100
Wire Wire Line
	2150 2100 2300 2100
Connection ~ 2150 950 
Wire Wire Line
	2150 950  2300 950 
Wire Wire Line
	1950 1150 1950 1350
Wire Wire Line
	1950 2500 2300 2500
Wire Wire Line
	1150 1150 1950 1150
Wire Wire Line
	2300 1350 1950 1350
Connection ~ 1950 1350
Wire Wire Line
	1950 1350 1950 2500
$Comp
L Device:Transformer_1P_2S T?
U 1 1 5F542A60
P 2700 3450
F 0 "T?" H 2700 4031 50  0000 C CNN
F 1 "Transformer_1P_2S" H 2700 3940 50  0000 C CNN
F 2 "" H 2700 3450 50  0001 C CNN
F 3 "~" H 2700 3450 50  0001 C CNN
	1    2700 3450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
