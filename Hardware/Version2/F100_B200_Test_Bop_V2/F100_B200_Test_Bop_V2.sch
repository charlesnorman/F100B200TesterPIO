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
L F100_B200_Test_Bop_V2-rescue:OPA548-F100B200TestPanel IC1
U 1 1 5F4A725B
P 2700 1850
F 0 "IC1" H 2650 1750 50  0000 C CNN
F 1 "OPA548T" H 2700 2250 50  0001 C CNN
F 2 "Package_TO_SOT_THT:TO-220-7_P2.54x3.7mm_StaggerOdd_Lead3.8mm_Vertical" H 2700 1850 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fopa548" H 2700 1850 50  0001 L BNN
F 4 "Power Amplifier 1 Circuit  TO-220-7" H 2700 1850 50  0001 C CNN "Description"
F 5 "296-23089-5-ND" H 2700 1850 50  0001 C CNN "DigikeyPart#"
	1    2700 1850
	1    0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:LMC662-F100B200TestPanel U4
U 1 1 5F4A0F70
P 2000 1850
F 0 "U4" H 1950 1850 50  0000 C CNN
F 1 "LMC662" H 2050 1650 50  0000 C CNN
F 2 "lib_fp_pretty:SOCKET_DIP-8_7.62mm_Conn" H 2000 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 2000 1850 50  0001 C CNN
F 4 "IC OPAMP GP 2 CIRCUIT 8DIP" H 2000 1850 50  0001 C CNN "Description"
F 5 "LMC662AIN/NOPB-ND" H 2000 1850 50  0001 C CNN "DigikeyPart#"
F 6 "Adafruit Industries LLC" H 2000 1850 50  0001 C CNN "Field4"
	1    2000 1850
	1    0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:LMC662-F100B200TestPanel U4
U 2 1 5F4A3789
P 2000 1050
F 0 "U4" H 1950 1050 50  0000 C CNN
F 1 "LMC662" H 2100 900 50  0000 C CNN
F 2 "lib_fp_pretty:SOCKET_DIP-8_7.62mm_Conn" H 2000 1050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 2000 1050 50  0001 C CNN
F 4 "IC OPAMP GP 2 CIRCUIT 8DIP" H 2000 1050 50  0001 C CNN "Description"
F 5 "LMC662AIN/NOPB-ND" H 2000 1050 50  0001 C CNN "DigikeyPart#"
F 6 "Adafruit Industries LLC" H 2000 1050 50  0001 C CNN "Field4"
	2    2000 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1850 2300 2150
Wire Wire Line
	2300 2150 1700 2150
Wire Wire Line
	1700 2150 1700 1950
Wire Wire Line
	2300 1850 2400 1850
Connection ~ 2300 1850
$Comp
L power:GND #PWR05
U 1 1 5F536893
P 2600 2600
F 0 "#PWR05" H 2600 2350 50  0001 C CNN
F 1 "GND" H 2605 2427 50  0000 C CNN
F 2 "" H 2600 2600 50  0001 C CNN
F 3 "" H 2600 2600 50  0001 C CNN
	1    2600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1050 2350 1050
Wire Wire Line
	3000 1050 3000 1850
$Comp
L Device:R R11
U 1 1 5F58B284
P 2400 2450
F 0 "R11" H 2470 2496 50  0000 L CNN
F 1 "1.21k" H 2470 2405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2330 2450 50  0001 C CNN
F 3 "https://www.vishay.com/docs/28722/sfr16s25.pdf" H 2400 2450 50  0001 C CNN
F 4 "1.21 kOhms ±1% 0.5W, 1/2W Through Hole Resistor Axial  Metal Film" H 2400 2450 50  0001 C CNN "Description"
F 5 "PPC1.21KXCT-ND" H 2400 2450 50  0001 C CNN "DigikeyPart#"
	1    2400 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5F593A01
P 3000 2100
F 0 "R12" H 3070 2146 50  0000 L CNN
F 1 "10k" H 3070 2055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2930 2100 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 3000 2100 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 3000 2100 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 3000 2100 50  0001 C CNN "DigikeyPart#"
	1    3000 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2050 2400 2300
Wire Wire Line
	2400 2300 3000 2300
Wire Wire Line
	3000 2300 3000 2250
Connection ~ 2400 2300
Wire Wire Line
	2600 2250 2600 2600
Wire Wire Line
	2600 2600 2400 2600
$Comp
L Mechanical:Heatsink HS1
U 1 1 5F4B150C
P 2850 1450
F 0 "HS1" H 2800 1700 50  0000 L CNN
F 1 "Heatsink" H 2992 1480 50  0001 L CNN
F 2 "lib_fp_pretty:HSINK_529802B02500G" H 2862 1450 50  0001 C CNN
F 3 "https://www.boydcorp.com/aavid-datasheets/Board-Level-Cooling-Extruded-5290.pdf" H 2862 1450 50  0001 C CNN
F 4 "HEATSINK TO-220 W/PINS 1.5\"TALL" H 2850 1450 50  0001 C CNN "Description"
F 5 "HS350-ND" H 2850 1450 50  0001 C CNN "DigikeyPart#"
	1    2850 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5F78DD47
P 7850 1550
F 0 "R13" H 7920 1596 50  0000 L CNN
F 1 "2.7k" H 7920 1505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7780 1550 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 7850 1550 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 7850 1550 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 7850 1550 50  0001 C CNN "DigikeyPart#"
	1    7850 1550
	0    1    1    0   
$EndComp
$Comp
L Mechanical:Heatsink HS2
U 1 1 5F4AF6A3
P 7700 1300
F 0 "HS2" H 7842 1421 50  0000 L CNN
F 1 "Heatsink" H 7842 1330 50  0000 L CNN
F 2 "lib_fp_pretty:HSINK_529802B02500G" H 7712 1300 50  0001 C CNN
F 3 "https://www.boydcorp.com/aavid-datasheets/Board-Level-Cooling-Extruded-5290.pdf" H 7712 1300 50  0001 C CNN
F 4 "HEATSINK TO-220 W/PINS 1.5\"TALL" H 7700 1300 50  0001 C CNN "Description"
F 5 "HS350-ND" H 7700 1300 50  0001 C CNN "DigikeyPart#"
	1    7700 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F6315D9
P 8200 1650
F 0 "#PWR07" H 8200 1400 50  0001 C CNN
F 1 "GND" H 8205 1477 50  0000 C CNN
F 2 "" H 8200 1650 50  0001 C CNN
F 3 "" H 8200 1650 50  0001 C CNN
	1    8200 1650
	-1   0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:FQP30N06L-F100B200TestPanel Q1
U 1 1 5F4E2F9D
P 8100 1450
F 0 "Q1" H 8308 1496 50  0000 L CNN
F 1 "FQP30N06L" H 8308 1405 50  0000 L CNN
F 2 "lib_fp_pretty:TO220V" H 8100 1450 50  0001 L BNN
F 3 "https://www.onsemi.com/pub/Collateral/FQP30N06L-D.pdf" H 8100 1450 50  0001 C CNN
F 4 "N-Channel 60V 32A (Tc) 79W (Tc) Through Hole TO-220-3" H 8100 1450 50  0001 C CNN "Description"
F 5 "FQP30N06L-ND" H 8100 1450 50  0001 C CNN "DigikeyPart#"
	1    8100 1450
	1    0    0    -1  
$EndComp
Connection ~ 9500 5050
$Comp
L power:GND #PWR018
U 1 1 5FA359DE
P 9500 5050
F 0 "#PWR018" H 9500 4800 50  0001 C CNN
F 1 "GND" H 9505 4877 50  0000 C CNN
F 2 "" H 9500 5050 50  0001 C CNN
F 3 "" H 9500 5050 50  0001 C CNN
	1    9500 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 5050 9650 5050
Wire Wire Line
	8450 4400 8900 4400
Wire Wire Line
	8550 3950 8900 3950
Wire Wire Line
	8550 3750 8550 3950
Wire Wire Line
	8550 3500 8900 3500
Wire Wire Line
	8800 2200 8150 2200
Connection ~ 9650 4200
Wire Wire Line
	9650 4200 9900 4200
Wire Wire Line
	9600 3100 9950 3100
Wire Wire Line
	9700 3000 9950 3000
Wire Wire Line
	9700 2800 9700 3000
Wire Wire Line
	9400 2800 9700 2800
Wire Wire Line
	9800 2900 9950 2900
Wire Wire Line
	9800 2500 9800 2900
Wire Wire Line
	9250 2500 9800 2500
Wire Wire Line
	9950 2200 9950 2800
Wire Wire Line
	9650 4150 9650 4050
Wire Wire Line
	9650 4600 9650 4500
Wire Wire Line
	9650 5050 9650 4950
Connection ~ 9650 4650
Wire Wire Line
	9950 4650 9950 3500
Wire Wire Line
	9650 4650 9950 4650
Wire Wire Line
	9900 3400 9950 3400
Wire Wire Line
	9900 4200 9900 3400
Connection ~ 9650 3750
Wire Wire Line
	9850 3300 9950 3300
Wire Wire Line
	9850 3750 9850 3300
Wire Wire Line
	9650 3750 9850 3750
Connection ~ 9650 3300
Wire Wire Line
	9650 3200 9950 3200
Wire Wire Line
	9650 3300 9650 3200
Wire Wire Line
	9650 3700 9650 3600
Wire Wire Line
	9500 3300 9650 3300
$Comp
L Connector:Screw_Terminal_01x08 J5
U 1 1 5F80D6E3
P 10150 3100
F 0 "J5" H 10068 2567 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 10068 2566 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TB001-500-08BE" H 10150 3100 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 10150 3100 50  0001 C CNN
F 4 "8 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 10150 3100 50  0001 C CNN "Description"
F 5 "102-6140-ND" H 10150 3100 50  0001 C CNN "DigikeyPart#"
	1    10150 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5F7A2DB1
P 9450 3100
F 0 "R21" V 9243 3100 50  0000 C CNN
F 1 "10k" V 9334 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9380 3100 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9450 3100 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 9450 3100 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 9450 3100 50  0001 C CNN "DigikeyPart#"
	1    9450 3100
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D12
U 1 1 5F7A2DA9
P 9100 3300
F 0 "D12" H 9100 3175 50  0000 C CNN
F 1 "D_Zener" V 9145 3380 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 9100 3300 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 9100 3300 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 9100 3300 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 9100 3300 50  0001 C CNN "DigikeyPart#"
	1    9100 3300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 5F79AEA1
P 8950 2200
F 0 "R14" V 8743 2200 50  0000 C CNN
F 1 "10k" V 8834 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8880 2200 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8950 2200 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 8950 2200 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 8950 2200 50  0001 C CNN "DigikeyPart#"
	1    8950 2200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D9
U 1 1 5F79AE99
P 8650 2400
F 0 "D9" H 8650 2275 50  0000 C CNN
F 1 "D_Zener" V 8695 2480 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8650 2400 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8650 2400 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8650 2400 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8650 2400 50  0001 C CNN "DigikeyPart#"
	1    8650 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R19
U 1 1 5F79329B
P 9100 2500
F 0 "R19" V 8893 2500 50  0000 C CNN
F 1 "10k" V 8984 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9030 2500 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9100 2500 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 9100 2500 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 9100 2500 50  0001 C CNN "DigikeyPart#"
	1    9100 2500
	0    1    1    0   
$EndComp
Connection ~ 9500 3700
$Comp
L power:GND #PWR015
U 1 1 5F76472F
P 9500 3700
F 0 "#PWR015" H 9500 3450 50  0001 C CNN
F 1 "GND" H 9505 3527 50  0000 C CNN
F 2 "" H 9500 3700 50  0001 C CNN
F 3 "" H 9500 3700 50  0001 C CNN
	1    9500 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 5F764729
P 9050 3500
F 0 "R15" H 9120 3546 50  0000 L CNN
F 1 "2.7k" H 9120 3455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8980 3500 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9050 3500 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 9050 3500 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 9050 3500 50  0001 C CNN "DigikeyPart#"
	1    9050 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 3700 9500 3700
$Comp
L Device:D D13
U 1 1 5F76471E
P 9650 3450
F 0 "D13" V 9604 3530 50  0000 L CNN
F 1 "1N4004-TP" V 9695 3530 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9650 3450 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9650 3450 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9650 3450 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9650 3450 50  0001 C CNN "Description"
	1    9650 3450
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q2
U 1 1 5F764716
P 9400 3500
F 0 "Q2" H 9450 3500 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9591 3455 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9600 3600 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 9400 3500 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 9400 3500 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 9400 3500 50  0001 C CNN "DigikeyPart#"
	1    9400 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5F758163
P 9050 4850
F 0 "R18" H 9120 4896 50  0000 L CNN
F 1 "2.7k" H 9120 4805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8980 4850 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9050 4850 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 9050 4850 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 9050 4850 50  0001 C CNN "DigikeyPart#"
	1    9050 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 4650 9650 4650
$Comp
L Device:D D16
U 1 1 5F758158
P 9650 4800
F 0 "D16" V 9604 4880 50  0000 L CNN
F 1 "1N4004-TP" V 9695 4880 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9650 4800 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9650 4800 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9650 4800 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9650 4800 50  0001 C CNN "Description"
	1    9650 4800
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q5
U 1 1 5F758150
P 9400 4850
F 0 "Q5" H 9450 4850 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9591 4805 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9600 4950 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 9400 4850 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 9400 4850 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 9400 4850 50  0001 C CNN "DigikeyPart#"
	1    9400 4850
	1    0    0    -1  
$EndComp
Connection ~ 9500 4600
$Comp
L power:GND #PWR017
U 1 1 5F74E531
P 9500 4600
F 0 "#PWR017" H 9500 4350 50  0001 C CNN
F 1 "GND" H 9505 4427 50  0000 C CNN
F 2 "" H 9500 4600 50  0001 C CNN
F 3 "" H 9500 4600 50  0001 C CNN
	1    9500 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 5F74E52B
P 9050 4400
F 0 "R17" H 9120 4446 50  0000 L CNN
F 1 "2.7k" H 9120 4355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8980 4400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9050 4400 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 9050 4400 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 9050 4400 50  0001 C CNN "DigikeyPart#"
	1    9050 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 4200 9650 4200
Wire Wire Line
	9650 4600 9500 4600
$Comp
L Device:D D15
U 1 1 5F74E520
P 9650 4350
F 0 "D15" V 9604 4430 50  0000 L CNN
F 1 "1N4004-TP" V 9695 4430 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9650 4350 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9650 4350 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9650 4350 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9650 4350 50  0001 C CNN "Description"
	1    9650 4350
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q4
U 1 1 5F74E518
P 9400 4400
F 0 "Q4" H 9450 4400 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9591 4355 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9600 4500 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 9400 4400 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 9400 4400 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 9400 4400 50  0001 C CNN "DigikeyPart#"
	1    9400 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 5F729444
P 9250 2800
F 0 "R20" V 9043 2800 50  0000 C CNN
F 1 "10k" V 9134 2800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9180 2800 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9250 2800 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 9250 2800 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 9250 2800 50  0001 C CNN "DigikeyPart#"
	1    9250 2800
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D11
U 1 1 5F712650
P 8900 3000
F 0 "D11" H 8900 2875 50  0000 C CNN
F 1 "D_Zener" V 8945 3080 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8900 3000 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8900 3000 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8900 3000 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8900 3000 50  0001 C CNN "DigikeyPart#"
	1    8900 3000
	-1   0    0    1   
$EndComp
Connection ~ 9500 4150
$Comp
L power:GND #PWR016
U 1 1 5F6F78AA
P 9500 4150
F 0 "#PWR016" H 9500 3900 50  0001 C CNN
F 1 "GND" H 9505 3977 50  0000 C CNN
F 2 "" H 9500 4150 50  0001 C CNN
F 3 "" H 9500 4150 50  0001 C CNN
	1    9500 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5F6A0642
P 9050 3950
F 0 "R16" H 9120 3996 50  0000 L CNN
F 1 "2.7k" H 9120 3905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8980 3950 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9050 3950 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 9050 3950 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 9050 3950 50  0001 C CNN "DigikeyPart#"
	1    9050 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 3750 9650 3750
Wire Wire Line
	9650 4150 9500 4150
$Comp
L Device:D D14
U 1 1 5F6A0636
P 9650 3900
F 0 "D14" V 9604 3980 50  0000 L CNN
F 1 "1N4004-TP" V 9695 3980 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9650 3900 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9650 3900 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9650 3900 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9650 3900 50  0001 C CNN "Description"
	1    9650 3900
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q3
U 1 1 5F6A062E
P 9400 3950
F 0 "Q3" H 9450 3950 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9591 3905 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9600 4050 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 9400 3950 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 9400 3950 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 9400 3950 50  0001 C CNN "DigikeyPart#"
	1    9400 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x08 J2
U 1 1 5F506EAD
P 5000 1400
F 0 "J2" H 4918 867 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 4918 866 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TB001-500-08BE" H 5000 1400 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 5000 1400 50  0001 C CNN
F 4 "8 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 5000 1400 50  0001 C CNN "Description"
F 5 "102-6140-ND" H 5000 1400 50  0001 C CNN "DigikeyPart#"
	1    5000 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:D_Zener D10
U 1 1 5F793293
P 8800 2700
F 0 "D10" H 8800 2575 50  0000 C CNN
F 1 "D_Zener" V 8845 2780 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8800 2700 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8800 2700 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8800 2700 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8800 2700 50  0001 C CNN "DigikeyPart#"
	1    8800 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8250 2500 8950 2500
Wire Wire Line
	8350 2800 9050 2800
Wire Wire Line
	8450 3100 9250 3100
Wire Wire Line
	8800 2200 8800 2400
Connection ~ 8800 2200
Wire Wire Line
	8950 2500 8950 2700
Connection ~ 8950 2500
Wire Wire Line
	9050 2800 9050 3000
Connection ~ 9050 2800
Wire Wire Line
	9050 2800 9100 2800
Wire Wire Line
	9250 3100 9250 3300
Connection ~ 9250 3100
Wire Wire Line
	9250 3100 9300 3100
$Comp
L power:GND #PWR012
U 1 1 5FBE7E62
P 8950 3300
F 0 "#PWR012" H 8950 3050 50  0001 C CNN
F 1 "GND" H 8955 3127 50  0000 C CNN
F 2 "" H 8950 3300 50  0001 C CNN
F 3 "" H 8950 3300 50  0001 C CNN
	1    8950 3300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5FBE88E8
P 8750 3000
F 0 "#PWR011" H 8750 2750 50  0001 C CNN
F 1 "GND" H 8755 2827 50  0000 C CNN
F 2 "" H 8750 3000 50  0001 C CNN
F 3 "" H 8750 3000 50  0001 C CNN
	1    8750 3000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5FBE905C
P 8650 2700
F 0 "#PWR010" H 8650 2450 50  0001 C CNN
F 1 "GND" H 8655 2527 50  0000 C CNN
F 2 "" H 8650 2700 50  0001 C CNN
F 3 "" H 8650 2700 50  0001 C CNN
	1    8650 2700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5FBE9663
P 8500 2400
F 0 "#PWR09" H 8500 2150 50  0001 C CNN
F 1 "GND" H 8505 2227 50  0000 C CNN
F 2 "" H 8500 2400 50  0001 C CNN
F 3 "" H 8500 2400 50  0001 C CNN
	1    8500 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5F4DCCF1
P 2100 1500
F 0 "R9" H 2170 1546 50  0000 L CNN
F 1 "20k" H 2170 1455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2030 1500 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 2100 1500 50  0001 C CNN
F 4 "RES 20K OHM 1/4W 1% AXIAL" H 2100 1500 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 2100 1500 50  0001 C CNN "DigikeyPart#"
	1    2100 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5F4DECA0
P 2350 1200
F 0 "R10" H 2420 1246 50  0000 L CNN
F 1 "10k" H 2420 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2280 1200 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 2350 1200 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 2350 1200 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 2350 1200 50  0001 C CNN "DigikeyPart#"
	1    2350 1200
	1    0    0    -1  
$EndComp
Connection ~ 2350 1050
Wire Wire Line
	2350 1050 3000 1050
Wire Wire Line
	1700 1350 2100 1350
Wire Wire Line
	1700 1150 1700 1350
Wire Wire Line
	2100 1350 2350 1350
Connection ~ 2100 1350
$Comp
L power:GND #PWR04
U 1 1 5F504682
P 2100 1650
F 0 "#PWR04" H 2100 1400 50  0001 C CNN
F 1 "GND" H 2105 1477 50  0000 C CNN
F 2 "" H 2100 1650 50  0001 C CNN
F 3 "" H 2100 1650 50  0001 C CNN
	1    2100 1650
	0    -1   -1   0   
$EndComp
Text Notes 1850 850  0    50   ~ 0
Gain = 1.5
Text Notes 10250 3250 0    50   ~ 0
Battery type select
Text Notes 10250 3350 0    50   ~ 0
Heat/Cool Select
Text Notes 10250 3450 0    50   ~ 0
External/Internal Select
Text Label 2600 1650 2    50   ~ 0
24VDC
$Comp
L F100_B200_Test_Bop_V2-rescue:Adafruit-MCP4725 U2
U 1 1 5F882337
P 1050 800
F 0 "U2" H 900 850 50  0000 L CNN
F 1 "MCP4725" H 1250 350 50  0000 L CNN
F 2 "lib_fp_pretty:Adafruit-MCP4725" H 1050 800 50  0001 C CNN
F 3 "https://cdn-shop.adafruit.com/datasheets/mcp4725.pdf" H 1050 800 50  0001 C CNN
F 4 "Bit Samples Per Second Digital to Analog Converter (DAC) Evaluation Board" H 1050 800 50  0001 C CNN "Description"
F 5 "1528-1010-ND" H 1050 800 50  0001 C CNN "DigikeyPart#"
	1    1050 800 
	1    0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:Adafruit-MCP4725 U3
U 1 1 5F884646
P 1050 1600
F 0 "U3" H 950 1650 50  0000 L CNN
F 1 "MCP4725" H 1200 1150 50  0000 L CNN
F 2 "lib_fp_pretty:Adafruit-MCP4725" H 1050 1600 50  0001 C CNN
F 3 "https://cdn-shop.adafruit.com/datasheets/mcp4725.pdf" H 1050 1600 50  0001 C CNN
F 4 "Bit Samples Per Second Digital to Analog Converter (DAC) Evaluation Board" H 1050 1600 50  0001 C CNN "Description"
F 5 "1528-1010-ND" H 1050 1600 50  0001 C CNN "DigikeyPart#"
	1    1050 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 950  1700 950 
Wire Wire Line
	1500 1750 1700 1750
$Comp
L power:GND #PWR02
U 1 1 5F8D6A78
P 900 2200
F 0 "#PWR02" H 900 1950 50  0001 C CNN
F 1 "GND" H 905 2027 50  0000 C CNN
F 2 "" H 900 2200 50  0001 C CNN
F 3 "" H 900 2200 50  0001 C CNN
	1    900  2200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F8D7CA5
P 900 1400
F 0 "#PWR01" H 900 1150 50  0001 C CNN
F 1 "GND" H 905 1227 50  0000 C CNN
F 2 "" H 900 1400 50  0001 C CNN
F 3 "" H 900 1400 50  0001 C CNN
	1    900  1400
	0    1    1    0   
$EndComp
Wire Wire Line
	900  1400 1150 1400
Wire Wire Line
	900  2200 1150 2200
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 5F758433
P 7450 750
F 0 "J6" H 7530 696 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 7530 651 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TB001-500-02BE" H 7450 750 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 7450 750 50  0001 C CNN
F 4 "2 Position Wire to Board Terminal Block" H 7450 750 50  0001 C CNN "Description"
F 5 "102-6134-ND" H 7450 750 50  0001 C CNN "DigikeyPart#"
	1    7450 750 
	0    -1   -1   0   
$EndComp
Text Label 7450 950  3    50   ~ 0
12VDC
$Comp
L Connector:Screw_Terminal_01x04 J7
U 1 1 5F7C4335
P 7000 750
F 0 "J7" H 7080 696 50  0000 L CNN
F 1 "Screw_Terminal_01x04" H 7080 651 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TB001-500-04BE" H 7000 750 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 7000 750 50  0001 C CNN
F 4 "4 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 7000 750 50  0001 C CNN "Description"
F 5 "102-6136-ND" H 7000 750 50  0001 C CNN "DigikeyPart#"
	1    7000 750 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 950  7000 1100
Wire Wire Line
	7200 950  7200 1100
$Comp
L power:GND #PWR019
U 1 1 5F818A24
P 7000 1100
F 0 "#PWR019" H 7000 850 50  0001 C CNN
F 1 "GND" H 7005 927 50  0000 C CNN
F 2 "" H 7000 1100 50  0001 C CNN
F 3 "" H 7000 1100 50  0001 C CNN
	1    7000 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6900 1400 6900 950 
Wire Wire Line
	7100 1400 7100 950 
Text Label 6900 1400 3    50   ~ 0
12VDC
Text Label 7100 1400 3    50   ~ 0
24VDC
$Comp
L Connector:Screw_Terminal_01x08 J15
U 1 1 5F85063F
P 10100 5700
F 0 "J15" H 10018 5167 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 10018 5166 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TB001-500-08BE" H 10100 5700 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 10100 5700 50  0001 C CNN
F 4 "8 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 10100 5700 50  0001 C CNN "Description"
F 5 "102-6140-ND" H 10100 5700 50  0001 C CNN "DigikeyPart#"
	1    10100 5700
	1    0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-108-14-T-S-F100B200TestPanel J13
U 1 1 5F865791
P 8950 5800
F 0 "J13" H 8692 6415 50  0000 C CNN
F 1 "ESQ-108-14-T-S" H 8692 6324 50  0000 C CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 8950 5800 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 8950 5800 50  0001 L BNN
F 4 "R" H 8950 5800 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 8950 5800 50  0001 L BNN "Field5"
F 6 "CONN SOCKET 8POS 0.1 TIN PCB" H 8950 5800 50  0001 C CNN "Description"
	1    8950 5800
	-1   0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-108-14-T-S-F100B200TestPanel J11
U 1 1 5F8683FE
P 7650 3650
F 0 "J11" H 7392 4265 50  0000 C CNN
F 1 "ESQ-108-14-T-S" H 7392 4174 50  0000 C CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 7650 3650 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 7650 3650 50  0001 L BNN
F 4 "R" H 7650 3650 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 7650 3650 50  0001 L BNN "Field5"
F 6 "CONN SOCKET 8POS 0.1 TIN PCB" H 7650 3650 50  0001 C CNN "Description"
	1    7650 3650
	-1   0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-110-14-T-S-F100B200TestPanel J12
U 1 1 5F869ED0
P 9000 1400
F 0 "J12" H 8692 2023 50  0000 C CNN
F 1 "ESQ-110-14-T-S" H 8928 1380 50  0001 L CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 8350 2150 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 8350 2400 50  0001 L BNN
F 4 "R" H 8400 2050 50  0001 L BNN "Field4"
F 5 "Samtec" H 8400 2300 50  0001 L BNN "Field5"
F 6 "10 Position Elevated Socket Connector Through Hole" H 9000 1400 50  0001 C CNN "Description"
F 7 "SAM15577-ND" H 9000 1400 50  0001 C CNN "DigikeyPart#"
	1    9000 1400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9450 5400 9900 5400
Wire Wire Line
	9900 5500 9450 5500
Wire Wire Line
	9450 5600 9900 5600
Wire Wire Line
	9450 5800 9900 5800
Wire Wire Line
	9900 5900 9450 5900
Wire Wire Line
	9450 6000 9900 6000
Wire Wire Line
	9900 6100 9450 6100
Text Label 9550 5400 0    50   ~ 0
D14
Text Label 9550 5500 0    50   ~ 0
D15
Text Label 9550 5600 0    50   ~ 0
D16
Wire Wire Line
	9450 5700 9900 5700
Text Label 9550 5700 0    50   ~ 0
D17
Text Label 9550 5800 0    50   ~ 0
D18
Text Label 9550 5900 0    50   ~ 0
D19
Text Label 9550 6000 0    50   ~ 0
D20
Text Label 9550 6100 0    50   ~ 0
D21
Wire Wire Line
	8150 3950 8150 4850
Wire Wire Line
	8150 4850 8900 4850
Wire Wire Line
	8150 3850 8450 3850
Wire Wire Line
	8450 3850 8450 4400
Wire Wire Line
	8150 3750 8550 3750
Wire Wire Line
	8150 3650 8550 3650
Wire Wire Line
	8550 3500 8550 3650
Wire Wire Line
	8150 3550 8450 3550
Wire Wire Line
	8450 3100 8450 3550
Wire Wire Line
	8150 3450 8350 3450
Wire Wire Line
	8350 2800 8350 3450
Wire Wire Line
	8150 3350 8250 3350
Wire Wire Line
	8250 2500 8250 3350
Wire Wire Line
	8150 2200 8150 3250
Text Label 8150 2200 0    50   ~ 0
D7
Text Label 8250 2700 0    50   ~ 0
D6
Text Label 8350 2950 0    50   ~ 0
D5
Text Label 8450 3300 0    50   ~ 0
D4
Text Label 8550 3650 0    50   ~ 0
D3
Text Label 8550 3950 0    50   ~ 0
D2
Text Label 8450 4400 0    50   ~ 0
D1
Text Label 8150 4850 0    50   ~ 0
D0
Wire Wire Line
	9100 2200 9950 2200
$Comp
L Connector:Screw_Terminal_01x10 J14
U 1 1 5FAF6018
P 10150 1300
F 0 "J14" H 10230 1246 50  0000 L CNN
F 1 "TB001-500-10BE" H 10230 1201 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TB001-500-10BE" H 10150 1300 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 10150 1300 50  0001 C CNN
F 4 "102-6142-ND" H 10150 1300 50  0001 C CNN "DigikeyPart#"
F 5 "10 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 10150 1300 50  0001 C CNN "Description"
	1    10150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 900  9950 900 
Wire Wire Line
	9950 1000 9500 1000
Wire Wire Line
	9500 1100 9950 1100
Wire Wire Line
	9950 1200 9500 1200
Wire Wire Line
	9500 1300 9950 1300
Wire Wire Line
	9950 1400 9500 1400
Wire Wire Line
	9500 1500 9950 1500
Wire Wire Line
	9950 1600 9500 1600
Wire Wire Line
	9500 1700 9950 1700
Wire Wire Line
	9950 1800 9500 1800
Text Label 9600 900  0    50   ~ 0
SCL1
Text Label 9600 1000 0    50   ~ 0
SDA1
Text Label 9600 1100 0    50   ~ 0
AREF
Text Label 9600 1200 0    50   ~ 0
GND
Text Label 9600 1300 0    50   ~ 0
D13
Text Label 9600 1400 0    50   ~ 0
D12
Text Label 9600 1500 0    50   ~ 0
D11
Text Label 9600 1600 0    50   ~ 0
D10
Text Label 9600 1700 0    50   ~ 0
D9
Text Label 9600 1800 0    50   ~ 0
D8
Connection ~ 2600 2600
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-108-14-T-S-F100B200TestPanel J10
U 1 1 5F7C0AF5
P 6300 1400
F 0 "J10" H 6328 1450 50  0000 L CNN
F 1 "ESQ-108-14-T-S" H 6328 1405 50  0001 L CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 6300 1400 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 6300 1400 50  0001 L BNN
F 4 "R" H 6300 1400 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 6300 1400 50  0001 L BNN "Field5"
F 6 "CONN SOCKET 8POS 0.1 TIN PCB" H 6300 1400 50  0001 C CNN "Description"
	1    6300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1000 5800 1000
Wire Wire Line
	5200 1100 5800 1100
Wire Wire Line
	5200 1200 5800 1200
Wire Wire Line
	5200 1300 5800 1300
Wire Wire Line
	5200 1400 5800 1400
Wire Wire Line
	5200 1500 5800 1500
Wire Wire Line
	5200 1600 5800 1600
Wire Wire Line
	5200 1700 5800 1700
Text Label 5400 1000 0    50   ~ 0
NC
Text Label 5400 1100 0    50   ~ 0
IOREF
Text Label 5400 1200 0    50   ~ 0
RESET
Text Label 5400 1300 0    50   ~ 0
+3V3
Text Label 5400 1400 0    50   ~ 0
+5V
Text Label 5400 1500 0    50   ~ 0
GND
Text Label 5400 1600 0    50   ~ 0
GND
Text Label 5400 1700 0    50   ~ 0
VIN
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-118-14-G-D-F100B200TestPanel J17
U 1 1 5F79852D
P 5800 5850
F 0 "J17" H 5650 6965 50  0000 C CNN
F 1 "ESQ-118-14-G-D" H 5650 6874 50  0001 C CNN
F 2 "SAMTEC_ESQ-118-14-G-D" H 5300 7000 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 5300 7150 50  0001 L BNN
F 4 "Samtec" H 5300 7150 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 5300 7000 50  0001 L BNN "Field5"
F 6 "36 Position Elevated Socket Connector Through Hole" H 5800 5850 50  0001 C CNN "Description"
F 7 "SAM9312-ND" H 5800 5850 50  0001 C CNN "DigikeyPart#"
	1    5800 5850
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x18 J18
U 1 1 5F8A937E
P 5700 4675
F 0 "J18" H 5625 5625 50  0000 L CNN
F 1 "102-TBL004V-508-18BE-2GY-ND" H 5780 4576 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TBL004V-508-18BE-2GY" H 5700 4675 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tbl004v-508.pdf" H 5700 4675 50  0001 C CNN
F 4 "Position Wire to Board Terminal Block" H 5700 4675 50  0001 C CNN "Description"
F 5 "102-TBL004V-508-18BE-2GY-ND" H 5700 4675 50  0001 C CNN "DigikeyPart#"
	1    5700 4675
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x18 J16
U 1 1 5F8ADE81
P 5700 7225
F 0 "J16" H 5618 8242 50  0000 C CNN
F 1 "102-TBL004V-508-18BE-2GY-ND" H 5618 8151 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TBL004V-508-18BE-2GY" H 5700 7225 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tbl004v-508.pdf" H 5700 7225 50  0001 C CNN
F 4 "Position Wire to Board Terminal Block" H 5700 7225 50  0001 C CNN "Description"
F 5 "102-TBL004V-508-18BE-2GY-ND" H 5700 7225 50  0001 C CNN "DigikeyPart#"
	1    5700 7225
	0    -1   1    0   
$EndComp
Wire Wire Line
	4900 5650 4900 4875
Wire Wire Line
	5000 4875 5000 5650
Wire Wire Line
	5100 5650 5100 4875
Wire Wire Line
	5200 4875 5200 5650
Wire Wire Line
	5300 5650 5300 4875
Wire Wire Line
	5400 4875 5400 5650
Wire Wire Line
	5500 5650 5500 4875
Wire Wire Line
	5600 4875 5600 5650
Wire Wire Line
	5700 5650 5700 4875
Wire Wire Line
	5800 4875 5800 5650
Wire Wire Line
	5900 5650 5900 4875
Wire Wire Line
	6000 5650 6000 4875
Wire Wire Line
	6100 4875 6100 5650
Wire Wire Line
	6200 5650 6200 4875
Wire Wire Line
	6300 4875 6300 5650
Wire Wire Line
	6400 5650 6400 4875
Wire Wire Line
	6500 4875 6500 5650
Wire Wire Line
	6600 5650 6600 4875
Wire Wire Line
	4900 7025 4900 6350
Wire Wire Line
	5000 6350 5000 7025
Wire Wire Line
	5100 7025 5100 6350
Wire Wire Line
	5200 6350 5200 7025
Wire Wire Line
	5300 7025 5300 6350
Wire Wire Line
	5400 6350 5400 7025
Wire Wire Line
	5500 7025 5500 6350
Wire Wire Line
	5600 6350 5600 7025
Wire Wire Line
	5700 7025 5700 6350
Wire Wire Line
	5800 6350 5800 7025
Wire Wire Line
	5900 7025 5900 6350
Wire Wire Line
	6000 6350 6000 7025
Wire Wire Line
	6100 7025 6100 6350
Wire Wire Line
	6200 6350 6200 7025
Wire Wire Line
	6300 7025 6300 6350
Wire Wire Line
	6400 6350 6400 7025
Wire Wire Line
	6500 7025 6500 6350
Wire Wire Line
	6600 6350 6600 7025
Text Label 750  1050 2    50   ~ 0
D20
Text Label 750  950  2    50   ~ 0
D21
Text Label 750  1750 2    50   ~ 0
D21
Text Label 750  1850 2    50   ~ 0
D20
$Comp
L power:GND #PWR021
U 1 1 5FB96DDE
P 4575 2650
F 0 "#PWR021" H 4575 2400 50  0001 C CNN
F 1 "GND" H 4580 2477 50  0000 C CNN
F 2 "" H 4575 2650 50  0001 C CNN
F 3 "" H 4575 2650 50  0001 C CNN
	1    4575 2650
	0    -1   -1   0   
$EndComp
Text Label 1150 700  0    50   ~ 0
+3V3
Text Label 1150 1500 0    50   ~ 0
+3V3
$Comp
L F100_B200_Test_Bop_V2-rescue:LMC662-F100B200TestPanel U4
U 3 1 5F82D490
P 3250 1300
F 0 "U4" H 3208 1346 50  0000 L CNN
F 1 "LMC662" H 3208 1255 50  0000 L CNN
F 2 "lib_fp_pretty:SOCKET_DIP-8_7.62mm_Conn" H 3250 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 3250 1300 50  0001 C CNN
F 4 "IC OPAMP GP 2 CIRCUIT 8DIP" H 3250 1300 50  0001 C CNN "Description"
F 5 "LMC662AIN/NOPB-ND" H 3250 1300 50  0001 C CNN "DigikeyPart#"
F 6 "Adafruit Industries LLC" H 3250 1300 50  0001 C CNN "Field4"
	3    3250 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F830489
P 3150 1600
F 0 "#PWR0101" H 3150 1350 50  0001 C CNN
F 1 "GND" H 3155 1427 50  0000 C CNN
F 2 "" H 3150 1600 50  0001 C CNN
F 3 "" H 3150 1600 50  0001 C CNN
	1    3150 1600
	1    0    0    -1  
$EndComp
Text Label 7700 1550 2    50   ~ 0
D11
Text Label 6125 3400 0    50   ~ 0
A7
Text Label 6125 3000 0    50   ~ 0
A6
Text Label 6200 2700 0    50   ~ 0
A5
Text Label 6200 2600 0    50   ~ 0
A4
Text Label 6200 2500 0    50   ~ 0
A3
Text Label 6125 2350 0    50   ~ 0
A2
Text Label 6125 2200 0    50   ~ 0
A1
Text Label 6125 1850 0    50   ~ 0
A0
$Comp
L power:GND #PWR03
U 1 1 5FFA82BA
P 6050 3100
F 0 "#PWR03" H 6050 2850 50  0001 C CNN
F 1 "GND" H 6055 2927 50  0000 C CNN
F 2 "" H 6050 3100 50  0001 C CNN
F 3 "" H 6050 3100 50  0001 C CNN
	1    6050 3100
	0    -1   -1   0   
$EndComp
Connection ~ 6050 3100
Wire Wire Line
	6050 3100 6050 3250
Connection ~ 6050 2950
Wire Wire Line
	6050 2950 6050 3100
Connection ~ 6050 2650
Wire Wire Line
	6050 2650 6050 2950
Connection ~ 6050 2500
Wire Wire Line
	6050 2500 6050 2650
Connection ~ 6050 2250
Wire Wire Line
	6050 2250 6050 2500
Connection ~ 6050 2100
Wire Wire Line
	6050 2100 6050 2250
Wire Wire Line
	6050 1950 6050 2100
Connection ~ 5750 2650
Wire Wire Line
	6100 2600 6300 2600
Wire Wire Line
	6100 2750 6100 2600
Wire Wire Line
	5750 2750 6100 2750
Wire Wire Line
	5750 2650 5750 2750
Connection ~ 5750 2500
Wire Wire Line
	6200 2500 6300 2500
Wire Wire Line
	6200 2400 6200 2500
Wire Wire Line
	5750 2400 6200 2400
Wire Wire Line
	5750 2500 5750 2400
Connection ~ 5750 2250
Wire Wire Line
	6250 2400 6300 2400
Wire Wire Line
	6250 2350 6250 2400
Wire Wire Line
	5750 2350 6250 2350
Wire Wire Line
	5750 2250 5750 2350
Connection ~ 5750 2100
Wire Wire Line
	6250 2300 6300 2300
Wire Wire Line
	6250 2200 6250 2300
Wire Wire Line
	5750 2200 6250 2200
Wire Wire Line
	5750 2100 5750 2200
Wire Wire Line
	6200 2700 6300 2700
Wire Wire Line
	6200 2850 6200 2700
Wire Wire Line
	5750 2850 6200 2850
Wire Wire Line
	6250 2800 6300 2800
Wire Wire Line
	6250 3000 6250 2800
Wire Wire Line
	5750 3000 6250 3000
Wire Wire Line
	6300 2900 6300 3400
Wire Wire Line
	6300 1850 6300 2200
Wire Wire Line
	5200 1950 5200 2200
Wire Wire Line
	5250 2100 5250 2300
Wire Wire Line
	5300 2250 5300 2400
Wire Wire Line
	5200 2900 5200 3250
Wire Wire Line
	5250 2800 5250 3100
Wire Wire Line
	5200 2800 5250 2800
Wire Wire Line
	5300 2700 5300 2950
Connection ~ 5750 2950
Wire Wire Line
	5750 2950 5750 2850
Wire Wire Line
	5750 3000 5750 3100
Connection ~ 5750 3100
Connection ~ 5750 3250
Wire Wire Line
	5750 3400 6300 3400
Wire Wire Line
	5750 3250 5750 3400
Connection ~ 5750 1950
Wire Wire Line
	5750 1850 6300 1850
Wire Wire Line
	5750 1950 5750 1850
$Comp
L Device:D_Zener D1
U 1 1 5FD2FFB9
P 5900 1950
F 0 "D1" H 6000 1900 50  0000 C CNN
F 1 "D_Zener" V 5945 2030 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 1950 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 1950 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 1950 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 1950 50  0001 C CNN "DigikeyPart#"
	1    5900 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D2
U 1 1 5FD2FBDC
P 5900 2100
F 0 "D2" H 6000 2050 50  0000 C CNN
F 1 "D_Zener" V 5945 2180 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 2100 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 2100 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 2100 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 2100 50  0001 C CNN "DigikeyPart#"
	1    5900 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D3
U 1 1 5FD2F777
P 5900 2250
F 0 "D3" H 6000 2200 50  0000 C CNN
F 1 "D_Zener" V 5945 2330 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 2250 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 2250 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 2250 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 2250 50  0001 C CNN "DigikeyPart#"
	1    5900 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D4
U 1 1 5FD2F3E3
P 5900 2500
F 0 "D4" H 6000 2450 50  0000 C CNN
F 1 "D_Zener" V 5945 2580 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 2500 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 2500 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 2500 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 2500 50  0001 C CNN "DigikeyPart#"
	1    5900 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D5
U 1 1 5FD2EF5B
P 5900 2650
F 0 "D5" H 6000 2600 50  0000 C CNN
F 1 "D_Zener" V 5945 2730 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 2650 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 2650 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 2650 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 2650 50  0001 C CNN "DigikeyPart#"
	1    5900 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D6
U 1 1 5FD2E7B0
P 5900 2950
F 0 "D6" H 5925 3075 50  0000 C CNN
F 1 "D_Zener" V 5945 3030 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 2950 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 2950 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 2950 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 2950 50  0001 C CNN "DigikeyPart#"
	1    5900 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D7
U 1 1 5FD2E481
P 5900 3100
F 0 "D7" H 6000 3050 50  0000 C CNN
F 1 "D_Zener" V 5945 3180 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 3100 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 3100 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 3100 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 3100 50  0001 C CNN "DigikeyPart#"
	1    5900 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D8
U 1 1 5FD2BAA4
P 5900 3250
F 0 "D8" H 6000 3175 50  0000 C CNN
F 1 "D_Zener" V 5945 3330 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5900 3250 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 5900 3250 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 5900 3250 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 5900 3250 50  0001 C CNN "DigikeyPart#"
	1    5900 3250
	1    0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-108-14-T-S-F100B200TestPanel J9
U 1 1 5FD17537
P 6800 2600
F 0 "J9" H 6828 2650 50  0000 L CNN
F 1 "ESQ-108-14-T-S" H 6828 2605 50  0001 L CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 6800 2600 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 6800 2600 50  0001 L BNN
F 4 "R" H 6800 2600 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 6800 2600 50  0001 L BNN "Field5"
F 6 "CONN SOCKET 8POS 0.1 TIN PCB" H 6800 2600 50  0001 C CNN "Description"
	1    6800 2600
	1    0    0    -1  
$EndComp
Text Label 5350 3550 0    50   ~ 0
A8
Wire Wire Line
	5200 3550 5600 3550
Wire Wire Line
	5200 1950 5450 1950
Wire Wire Line
	5450 2100 5250 2100
Wire Wire Line
	5300 2250 5450 2250
Wire Wire Line
	5450 2500 5200 2500
Wire Wire Line
	5300 2650 5450 2650
Wire Wire Line
	5450 2950 5300 2950
Wire Wire Line
	5250 3100 5450 3100
Wire Wire Line
	5450 3250 5200 3250
$Comp
L Device:R R8
U 1 1 5FD5B644
P 5600 3250
F 0 "R8" V 5600 3250 50  0000 C CNN
F 1 "10k" V 5650 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 3250 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 3250 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 3250 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 3250 50  0001 C CNN "DigikeyPart#"
	1    5600 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5FD5B212
P 5600 3100
F 0 "R7" V 5600 3100 50  0000 C CNN
F 1 "10k" V 5650 3300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 3100 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 3100 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 3100 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 3100 50  0001 C CNN "DigikeyPart#"
	1    5600 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5FD5AF23
P 5600 2950
F 0 "R6" V 5600 2950 50  0000 C CNN
F 1 "10k" V 5650 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 2950 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 2950 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 2950 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 2950 50  0001 C CNN "DigikeyPart#"
	1    5600 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5FD5AB75
P 5600 2650
F 0 "R5" V 5600 2650 50  0000 C CNN
F 1 "10k" V 5650 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 2650 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 2650 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 2650 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 2650 50  0001 C CNN "DigikeyPart#"
	1    5600 2650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5FD5A7B9
P 5600 2500
F 0 "R4" V 5600 2500 50  0000 C CNN
F 1 "10k" V 5650 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 2500 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 2500 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 2500 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 2500 50  0001 C CNN "DigikeyPart#"
	1    5600 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FD5A487
P 5600 2250
F 0 "R3" V 5600 2250 50  0000 C CNN
F 1 "10k" V 5650 2450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 2250 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 2250 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 2250 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 2250 50  0001 C CNN "DigikeyPart#"
	1    5600 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5FD59F6F
P 5600 2100
F 0 "R2" V 5600 2100 50  0000 C CNN
F 1 "10k" V 5650 2300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 2100 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 2100 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 2100 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 2100 50  0001 C CNN "DigikeyPart#"
	1    5600 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FD57D33
P 5600 1950
F 0 "R1" V 5600 1950 50  0000 C CNN
F 1 "10k" V 5650 2150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5530 1950 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 5600 1950 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 5600 1950 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 5600 1950 50  0001 C CNN "DigikeyPart#"
	1    5600 1950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x08 J1
U 1 1 5F4786FC
P 5000 2600
F 0 "J1" H 4918 2067 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 4918 2066 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TB001-500-08BE" H 5000 2600 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 5000 2600 50  0001 C CNN
F 4 "8 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 5000 2600 50  0001 C CNN "Description"
F 5 "102-6140-ND" H 5000 2600 50  0001 C CNN "DigikeyPart#"
	1    5000 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 2300 5250 2300
Wire Wire Line
	5200 2400 5300 2400
Wire Wire Line
	5200 2600 5300 2600
Wire Wire Line
	5300 2600 5300 2650
Wire Wire Line
	5200 2700 5300 2700
Text Label 7800 4550 0    50   ~ 0
GND_
Text Label 7800 4450 0    50   ~ 0
MOSI_
Text Label 7800 4350 0    50   ~ 0
+5V_
$Comp
L Connector:Screw_Terminal_01x08 J3
U 1 1 5F50C279
P 5000 3950
F 0 "J3" H 4918 3417 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 4918 3416 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TB001-500-08BE" H 5000 3950 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 5000 3950 50  0001 C CNN
F 4 "8 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 5000 3950 50  0001 C CNN "Description"
F 5 "102-6140-ND" H 5000 3950 50  0001 C CNN "DigikeyPart#"
	1    5000 3950
	-1   0    0    1   
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-108-14-T-S-F100B200TestPanel J8
U 1 1 5FCAE1B2
P 6100 3950
F 0 "J8" H 6128 4000 50  0000 L CNN
F 1 "ESQ-108-14-T-S" H 6128 3955 50  0001 L CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 6100 3950 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 6100 3950 50  0001 L BNN
F 4 "R" H 6100 3950 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 6100 3950 50  0001 L BNN "Field5"
F 6 "CONN SOCKET 8POS 0.1 TIN PCB" H 6100 3950 50  0001 C CNN "Description"
	1    6100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3650 5200 3650
Wire Wire Line
	5200 3750 5600 3750
Wire Wire Line
	5600 3850 5200 3850
Wire Wire Line
	5200 3950 5600 3950
Wire Wire Line
	5600 4050 5200 4050
Wire Wire Line
	5200 4150 5600 4150
Text Label 5350 3650 0    50   ~ 0
A9
Text Label 5350 3750 0    50   ~ 0
A10
Text Label 5350 3850 0    50   ~ 0
A11
Text Label 5350 3950 0    50   ~ 0
DAC0
Text Label 5350 4050 0    50   ~ 0
DAC1
Text Label 5350 4150 0    50   ~ 0
CANR
Text Label 5350 4250 0    50   ~ 0
CANT
Wire Wire Line
	5600 4250 5200 4250
Wire Wire Line
	8200 1250 8200 1000
Wire Wire Line
	8200 1000 7550 1000
Wire Wire Line
	7550 1000 7550 950 
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-103-14-G-D-F100B200TestPanel J19
U 1 1 5F798B33
P 7550 4450
F 0 "J19" H 7425 4765 50  0000 C CNN
F 1 "ESQ-103-14-G-D" H 7425 4674 50  0000 C CNN
F 2 "SAMTEC_ESQ-103-14-G-D" H 7150 4800 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 7150 4800 50  0001 L BNN
F 4 "Samtec" H 7150 4800 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 7150 4800 50  0001 L BNN "Field5"
F 6 "6 Position Elevated Socket Connector Through Hole" H 7550 4450 50  0001 C CNN "Description"
F 7 "SAM9289-ND" H 7550 4450 50  0001 C CNN "DigikeyPart#"
	1    7550 4450
	1    0    0    -1  
$EndComp
Text Label 7050 4350 2    50   ~ 0
MISO_
Text Label 7050 4450 2    50   ~ 0
SCK_
Text Label 7050 4550 2    50   ~ 0
RESET_
Text Label 7200 1100 3    50   ~ 0
12VDC
Text Label 3150 1000 0    50   ~ 0
12VDC
Text Label 3000 1950 0    50   ~ 0
BatSimulator
Text Label 4275 2850 0    50   ~ 0
D20
Text Label 4275 2750 0    50   ~ 0
D21
Text Label 4275 2550 0    50   ~ 0
+3V3
Wire Wire Line
	4275 2650 4575 2650
$Comp
L F100_B200_Test_Bop_V2-rescue:INA260-F100B200TestPanel U6
U 1 1 5F8A9991
P 3775 2700
F 0 "U6" H 3725 3075 50  0000 C CNN
F 1 "INA260" H 3725 2984 50  0000 C CNN
F 2 "lib_fp_pretty:Adafruit_INA260" H 3775 2700 50  0001 C CNN
F 3 "https://cdn-learn.adafruit.com/downloads/pdf/adafruit-ina260-current-voltage-power-sensor-breakout.pdf" H 3775 2700 50  0001 C CNN
F 4 "INA260 Current Monitor Power Management Evaluation Board" H 3775 2700 50  0001 C CNN "Description"
F 5 "1528-2955-ND" H 3775 2700 50  0001 C CNN "DigikeyPart#"
	1    3775 2700
	-1   0    0    -1  
$EndComp
Text Label 3325 2500 1    50   ~ 0
Charger
Text Notes 10250 2825 0    50   ~ 0
STAT_1
Text Notes 10250 2925 0    50   ~ 0
STAT_2
Text Notes 10250 3025 0    50   ~ 0
Power_On_Not
Text Notes 10250 3125 0    50   ~ 0
Plus_load
Wire Wire Line
	3000 1950 3225 1950
Wire Wire Line
	3225 1950 3225 2800
Wire Wire Line
	3225 2800 3375 2800
Connection ~ 3000 1950
Wire Wire Line
	3375 2700 3325 2700
Wire Wire Line
	3325 2700 3325 2500
$EndSCHEMATC
