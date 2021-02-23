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
P 1825 4225
F 0 "R13" H 1895 4271 50  0000 L CNN
F 1 "2.7k" H 1895 4180 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1755 4225 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 1825 4225 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 1825 4225 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 1825 4225 50  0001 C CNN "DigikeyPart#"
	1    1825 4225
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink HS2
U 1 1 5F4AF6A3
P 1100 3750
F 0 "HS2" H 1242 3871 50  0000 L CNN
F 1 "Heatsink" H 1242 3780 50  0000 L CNN
F 2 "lib_fp_pretty:HSINK_529802B02500G" H 1112 3750 50  0001 C CNN
F 3 "https://www.boydcorp.com/aavid-datasheets/Board-Level-Cooling-Extruded-5290.pdf" H 1112 3750 50  0001 C CNN
F 4 "HEATSINK TO-220 W/PINS 1.5\"TALL" H 1100 3750 50  0001 C CNN "Description"
F 5 "HS350-ND" H 1100 3750 50  0001 C CNN "DigikeyPart#"
	1    1100 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F6315D9
P 1925 3875
F 0 "#PWR07" H 1925 3625 50  0001 C CNN
F 1 "GND" H 1930 3702 50  0000 C CNN
F 2 "" H 1925 3875 50  0001 C CNN
F 3 "" H 1925 3875 50  0001 C CNN
	1    1925 3875
	0    -1   1    0   
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:FQP30N06L-F100B200TestPanel Q1
U 1 1 5F4E2F9D
P 1725 3975
F 0 "Q1" V 2125 3800 50  0000 L CNN
F 1 "FQP30N06L" V 2000 3475 50  0000 L CNN
F 2 "lib_fp_pretty:TO220V" H 1725 3975 50  0001 L BNN
F 3 "https://www.onsemi.com/pub/Collateral/FQP30N06L-D.pdf" H 1725 3975 50  0001 C CNN
F 4 "N-Channel 60V 32A (Tc) 79W (Tc) Through Hole TO-220-3" H 1725 3975 50  0001 C CNN "Description"
F 5 "FQP30N06L-ND" H 1725 3975 50  0001 C CNN "DigikeyPart#"
	1    1725 3975
	0    -1   -1   0   
$EndComp
Connection ~ 8975 3700
$Comp
L power:GND #PWR018
U 1 1 5FA359DE
P 8975 3700
F 0 "#PWR018" H 8975 3450 50  0001 C CNN
F 1 "GND" H 8980 3527 50  0000 C CNN
F 2 "" H 8975 3700 50  0001 C CNN
F 3 "" H 8975 3700 50  0001 C CNN
	1    8975 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	8975 3700 9125 3700
Wire Wire Line
	7800 5550 8150 5550
Wire Wire Line
	7800 5350 7800 5550
Wire Wire Line
	7800 5100 8150 5100
Wire Wire Line
	8050 3800 7400 3800
Wire Wire Line
	8850 4700 9200 4700
Wire Wire Line
	8950 4600 9200 4600
Wire Wire Line
	8950 4400 8950 4600
Wire Wire Line
	8650 4400 8950 4400
Wire Wire Line
	9050 4500 9200 4500
Wire Wire Line
	9050 4100 9050 4500
Wire Wire Line
	8500 4100 9050 4100
Wire Wire Line
	9200 3800 9200 4400
Wire Wire Line
	8900 5750 8900 5650
Wire Wire Line
	9125 3250 9125 3150
Wire Wire Line
	9125 3700 9125 3600
Connection ~ 9125 3300
Wire Wire Line
	9150 5000 9200 5000
Connection ~ 8900 5350
Wire Wire Line
	9100 4900 9200 4900
Wire Wire Line
	9100 5350 9100 4900
Wire Wire Line
	8900 5350 9100 5350
Connection ~ 8900 4900
Wire Wire Line
	8900 4800 9200 4800
Wire Wire Line
	8900 4900 8900 4800
Wire Wire Line
	8900 5300 8900 5200
Wire Wire Line
	8750 4900 8900 4900
$Comp
L Connector:Screw_Terminal_01x08 J5
U 1 1 5F80D6E3
P 9400 4700
F 0 "J5" H 9318 4167 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 9318 4166 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TB001-500-08BE" H 9400 4700 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 9400 4700 50  0001 C CNN
F 4 "8 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 9400 4700 50  0001 C CNN "Description"
F 5 "102-6140-ND" H 9400 4700 50  0001 C CNN "DigikeyPart#"
	1    9400 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5F7A2DB1
P 8700 4700
F 0 "R21" V 8493 4700 50  0000 C CNN
F 1 "10k" V 8584 4700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8630 4700 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8700 4700 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 8700 4700 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 8700 4700 50  0001 C CNN "DigikeyPart#"
	1    8700 4700
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D12
U 1 1 5F7A2DA9
P 8350 4900
F 0 "D12" H 8350 4775 50  0000 C CNN
F 1 "D_Zener" V 8395 4980 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8350 4900 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8350 4900 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8350 4900 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8350 4900 50  0001 C CNN "DigikeyPart#"
	1    8350 4900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 5F79AEA1
P 8200 3800
F 0 "R14" V 7993 3800 50  0000 C CNN
F 1 "10k" V 8084 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8130 3800 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8200 3800 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 8200 3800 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 8200 3800 50  0001 C CNN "DigikeyPart#"
	1    8200 3800
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D9
U 1 1 5F79AE99
P 7900 4000
F 0 "D9" H 7900 3875 50  0000 C CNN
F 1 "D_Zener" V 7945 4080 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7900 4000 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 7900 4000 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 7900 4000 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 7900 4000 50  0001 C CNN "DigikeyPart#"
	1    7900 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R19
U 1 1 5F79329B
P 8350 4100
F 0 "R19" V 8143 4100 50  0000 C CNN
F 1 "10k" V 8234 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8280 4100 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8350 4100 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 8350 4100 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 8350 4100 50  0001 C CNN "DigikeyPart#"
	1    8350 4100
	0    1    1    0   
$EndComp
Connection ~ 8750 5300
$Comp
L power:GND #PWR015
U 1 1 5F76472F
P 8750 5300
F 0 "#PWR015" H 8750 5050 50  0001 C CNN
F 1 "GND" H 8755 5127 50  0000 C CNN
F 2 "" H 8750 5300 50  0001 C CNN
F 3 "" H 8750 5300 50  0001 C CNN
	1    8750 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 5F764729
P 8300 5100
F 0 "R15" H 8370 5146 50  0000 L CNN
F 1 "2.7k" H 8370 5055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8230 5100 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8300 5100 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 8300 5100 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 8300 5100 50  0001 C CNN "DigikeyPart#"
	1    8300 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 5300 8750 5300
$Comp
L Device:D D13
U 1 1 5F76471E
P 8900 5050
F 0 "D13" H 8825 5175 50  0000 L CNN
F 1 "1N4004-TP" V 8945 5130 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 8900 5050 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 8900 5050 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 8900 5050 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 8900 5050 50  0001 C CNN "Description"
	1    8900 5050
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q2
U 1 1 5F764716
P 8650 5100
F 0 "Q2" H 8700 5100 50  0000 L CNN
F 1 "Q_NPN_EBC" H 8841 5055 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 8850 5200 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 8650 5100 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 8650 5100 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 8650 5100 50  0001 C CNN "DigikeyPart#"
	1    8650 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5F758163
P 8525 3500
F 0 "R18" H 8595 3546 50  0000 L CNN
F 1 "2.7k" H 8595 3455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8455 3500 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8525 3500 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 8525 3500 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 8525 3500 50  0001 C CNN "DigikeyPart#"
	1    8525 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	8975 3300 9125 3300
$Comp
L Device:D D16
U 1 1 5F758158
P 9125 3450
F 0 "D16" V 9079 3530 50  0000 L CNN
F 1 "1N4004-TP" V 9170 3530 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9125 3450 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9125 3450 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9125 3450 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9125 3450 50  0001 C CNN "Description"
	1    9125 3450
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q5
U 1 1 5F758150
P 8875 3500
F 0 "Q5" H 8925 3500 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9066 3455 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9075 3600 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 8875 3500 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 8875 3500 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 8875 3500 50  0001 C CNN "DigikeyPart#"
	1    8875 3500
	1    0    0    -1  
$EndComp
Connection ~ 8975 3250
$Comp
L power:GND #PWR017
U 1 1 5F74E531
P 8975 3250
F 0 "#PWR017" H 8975 3000 50  0001 C CNN
F 1 "GND" H 8980 3077 50  0000 C CNN
F 2 "" H 8975 3250 50  0001 C CNN
F 3 "" H 8975 3250 50  0001 C CNN
	1    8975 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 5F74E52B
P 8525 3050
F 0 "R17" H 8595 3096 50  0000 L CNN
F 1 "2.7k" H 8595 3005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8455 3050 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8525 3050 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 8525 3050 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 8525 3050 50  0001 C CNN "DigikeyPart#"
	1    8525 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	9125 3250 8975 3250
$Comp
L Device:D D15
U 1 1 5F74E520
P 9125 3000
F 0 "D15" V 9079 3080 50  0000 L CNN
F 1 "1N4004-TP" V 9170 3080 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9125 3000 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9125 3000 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9125 3000 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9125 3000 50  0001 C CNN "Description"
	1    9125 3000
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q4
U 1 1 5F74E518
P 8875 3050
F 0 "Q4" H 8925 3050 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9066 3005 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9075 3150 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 8875 3050 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 8875 3050 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 8875 3050 50  0001 C CNN "DigikeyPart#"
	1    8875 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 5F729444
P 8500 4400
F 0 "R20" V 8293 4400 50  0000 C CNN
F 1 "10k" V 8384 4400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8430 4400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8500 4400 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 8500 4400 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 8500 4400 50  0001 C CNN "DigikeyPart#"
	1    8500 4400
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D11
U 1 1 5F712650
P 8150 4600
F 0 "D11" H 8150 4475 50  0000 C CNN
F 1 "D_Zener" V 8195 4680 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8150 4600 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8150 4600 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8150 4600 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8150 4600 50  0001 C CNN "DigikeyPart#"
	1    8150 4600
	-1   0    0    1   
$EndComp
Connection ~ 8750 5750
$Comp
L power:GND #PWR016
U 1 1 5F6F78AA
P 8750 5750
F 0 "#PWR016" H 8750 5500 50  0001 C CNN
F 1 "GND" H 8755 5577 50  0000 C CNN
F 2 "" H 8750 5750 50  0001 C CNN
F 3 "" H 8750 5750 50  0001 C CNN
	1    8750 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5F6A0642
P 8300 5550
F 0 "R16" H 8370 5596 50  0000 L CNN
F 1 "2.7k" H 8370 5505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8230 5550 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8300 5550 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 8300 5550 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 8300 5550 50  0001 C CNN "DigikeyPart#"
	1    8300 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 5350 8900 5350
Wire Wire Line
	8900 5750 8750 5750
$Comp
L Device:D D14
U 1 1 5F6A0636
P 8900 5500
F 0 "D14" H 8825 5625 50  0000 L CNN
F 1 "1N4004-TP" V 8945 5580 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 8900 5500 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 8900 5500 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 8900 5500 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 8900 5500 50  0001 C CNN "Description"
	1    8900 5500
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q3
U 1 1 5F6A062E
P 8650 5550
F 0 "Q3" H 8700 5550 50  0000 L CNN
F 1 "Q_NPN_EBC" H 8841 5505 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 8850 5650 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 8650 5550 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 8650 5550 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 8650 5550 50  0001 C CNN "DigikeyPart#"
	1    8650 5550
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
P 8050 4300
F 0 "D10" H 8050 4175 50  0000 C CNN
F 1 "D_Zener" V 8095 4380 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8050 4300 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8050 4300 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8050 4300 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8050 4300 50  0001 C CNN "DigikeyPart#"
	1    8050 4300
	-1   0    0    1   
$EndComp
Wire Wire Line
	7500 4100 8200 4100
Wire Wire Line
	7600 4400 8300 4400
Wire Wire Line
	7700 4700 8500 4700
Wire Wire Line
	8050 3800 8050 4000
Connection ~ 8050 3800
Wire Wire Line
	8200 4100 8200 4300
Connection ~ 8200 4100
Wire Wire Line
	8300 4400 8300 4600
Connection ~ 8300 4400
Wire Wire Line
	8300 4400 8350 4400
Wire Wire Line
	8500 4700 8500 4900
Connection ~ 8500 4700
Wire Wire Line
	8500 4700 8550 4700
$Comp
L power:GND #PWR012
U 1 1 5FBE7E62
P 8200 4900
F 0 "#PWR012" H 8200 4650 50  0001 C CNN
F 1 "GND" H 8205 4727 50  0000 C CNN
F 2 "" H 8200 4900 50  0001 C CNN
F 3 "" H 8200 4900 50  0001 C CNN
	1    8200 4900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5FBE88E8
P 8000 4600
F 0 "#PWR011" H 8000 4350 50  0001 C CNN
F 1 "GND" H 8005 4427 50  0000 C CNN
F 2 "" H 8000 4600 50  0001 C CNN
F 3 "" H 8000 4600 50  0001 C CNN
	1    8000 4600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5FBE905C
P 7900 4300
F 0 "#PWR010" H 7900 4050 50  0001 C CNN
F 1 "GND" H 7905 4127 50  0000 C CNN
F 2 "" H 7900 4300 50  0001 C CNN
F 3 "" H 7900 4300 50  0001 C CNN
	1    7900 4300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5FBE9663
P 7750 4000
F 0 "#PWR09" H 7750 3750 50  0001 C CNN
F 1 "GND" H 7755 3827 50  0000 C CNN
F 2 "" H 7750 4000 50  0001 C CNN
F 3 "" H 7750 4000 50  0001 C CNN
	1    7750 4000
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
Text Notes 9500 4850 0    50   ~ 0
Battery type select
Text Notes 9500 4950 0    50   ~ 0
Heat/Cool Select
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
P 1025 4625
F 0 "J6" H 1105 4571 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 1105 4526 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TB001-500-02BE" H 1025 4625 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 1025 4625 50  0001 C CNN
F 4 "2 Position Wire to Board Terminal Block" H 1025 4625 50  0001 C CNN "Description"
F 5 "102-6134-ND" H 1025 4625 50  0001 C CNN "DigikeyPart#"
	1    1025 4625
	-1   0    0    1   
$EndComp
Text Label 1225 4625 0    50   ~ 0
12VDC
$Comp
L Connector:Screw_Terminal_01x04 J7
U 1 1 5F7C4335
P 1025 5075
F 0 "J7" H 1105 5021 50  0000 L CNN
F 1 "Screw_Terminal_01x04" H 1105 4976 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TB001-500-04BE" H 1025 5075 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 1025 5075 50  0001 C CNN
F 4 "4 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 1025 5075 50  0001 C CNN "Description"
F 5 "102-6136-ND" H 1025 5075 50  0001 C CNN "DigikeyPart#"
	1    1025 5075
	-1   0    0    1   
$EndComp
Wire Wire Line
	1225 5075 1375 5075
Wire Wire Line
	1225 4875 1375 4875
$Comp
L power:GND #PWR019
U 1 1 5F818A24
P 1375 5075
F 0 "#PWR019" H 1375 4825 50  0001 C CNN
F 1 "GND" H 1380 4902 50  0000 C CNN
F 2 "" H 1375 5075 50  0001 C CNN
F 3 "" H 1375 5075 50  0001 C CNN
	1    1375 5075
	0    -1   1    0   
$EndComp
Wire Wire Line
	1675 5175 1225 5175
Wire Wire Line
	1675 4975 1225 4975
Text Label 1675 4975 0    50   ~ 0
24VDC
$Comp
L Connector:Screw_Terminal_01x08 J15
U 1 1 5F85063F
P 10675 5950
F 0 "J15" H 10593 5417 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 10593 5416 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TB001-500-08BE" H 10675 5950 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 10675 5950 50  0001 C CNN
F 4 "8 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 10675 5950 50  0001 C CNN "Description"
F 5 "102-6140-ND" H 10675 5950 50  0001 C CNN "DigikeyPart#"
	1    10675 5950
	1    0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-108-14-T-S-F100B200TestPanel J13
U 1 1 5F865791
P 9525 6050
F 0 "J13" H 9267 6665 50  0000 C CNN
F 1 "ESQ-108-14-T-S" H 9267 6574 50  0000 C CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 9525 6050 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 9525 6050 50  0001 L BNN
F 4 "R" H 9525 6050 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 9525 6050 50  0001 L BNN "Field5"
F 6 "CONN SOCKET 8POS 0.1 TIN PCB" H 9525 6050 50  0001 C CNN "Description"
F 7 "SAM9303-ND" H 9525 6050 50  0001 C CNN "DigikeyPart#"
	1    9525 6050
	-1   0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-108-14-T-S-F100B200TestPanel J11
U 1 1 5F8683FE
P 6900 5250
F 0 "J11" H 6642 5865 50  0000 C CNN
F 1 "ESQ-108-14-T-S" H 6642 5774 50  0000 C CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 6900 5250 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 6900 5250 50  0001 L BNN
F 4 "R" H 6900 5250 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 6900 5250 50  0001 L BNN "Field5"
F 6 "CONN SOCKET 8POS 0.1 TIN PCB" H 6900 5250 50  0001 C CNN "Description"
F 7 "SAM9303-ND" H 6900 5250 50  0001 C CNN "DigikeyPart#"
	1    6900 5250
	-1   0    0    -1  
$EndComp
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-110-14-T-S-F100B200TestPanel J12
U 1 1 5F869ED0
P 6750 1925
F 0 "J12" H 6442 2548 50  0000 C CNN
F 1 "ESQ-110-14-T-S" H 6678 1905 50  0001 L CNN
F 2 "lib_fp_pretty:SAMTEC_ESQ-108-14-T-S" H 6100 2675 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 6100 2925 50  0001 L BNN
F 4 "R" H 6150 2575 50  0001 L BNN "Field4"
F 5 "Samtec" H 6150 2825 50  0001 L BNN "Field5"
F 6 "10 Position Elevated Socket Connector Through Hole" H 6750 1925 50  0001 C CNN "Description"
F 7 "SAM15577-ND" H 6750 1925 50  0001 C CNN "DigikeyPart#"
	1    6750 1925
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10025 5650 10475 5650
Wire Wire Line
	10475 5750 10025 5750
Wire Wire Line
	10025 5850 10475 5850
Wire Wire Line
	10025 6050 10475 6050
Wire Wire Line
	10475 6150 10025 6150
Wire Wire Line
	10025 6250 10475 6250
Wire Wire Line
	10475 6350 10025 6350
Text Label 10125 5650 0    50   ~ 0
D14
Text Label 10125 5750 0    50   ~ 0
D15
Text Label 10125 5850 0    50   ~ 0
D16
Wire Wire Line
	10025 5950 10475 5950
Text Label 10125 5950 0    50   ~ 0
D17
Text Label 10125 6050 0    50   ~ 0
D18
Text Label 10125 6150 0    50   ~ 0
D19
Text Label 10125 6250 0    50   ~ 0
D20
Text Label 10125 6350 0    50   ~ 0
D21
Wire Wire Line
	7400 5450 7700 5450
Wire Wire Line
	7400 5350 7800 5350
Wire Wire Line
	7400 5250 7800 5250
Wire Wire Line
	7800 5100 7800 5250
Wire Wire Line
	7400 5150 7700 5150
Wire Wire Line
	7700 4700 7700 5150
Wire Wire Line
	7400 5050 7600 5050
Wire Wire Line
	7600 4400 7600 5050
Wire Wire Line
	7400 4950 7500 4950
Wire Wire Line
	7500 4100 7500 4950
Wire Wire Line
	7400 3800 7400 4850
Text Label 7400 3800 0    50   ~ 0
D7
Text Label 7500 4300 0    50   ~ 0
D6
Text Label 7600 4550 0    50   ~ 0
D5
Text Label 7700 4900 0    50   ~ 0
D4
Text Label 7800 5250 0    50   ~ 0
D3
Text Label 7800 5550 0    50   ~ 0
D2
Text Label 7850 5900 0    50   ~ 0
D1
Text Label 7575 6075 0    50   ~ 0
D0
Wire Wire Line
	8350 3800 9200 3800
$Comp
L Connector:Screw_Terminal_01x10 J14
U 1 1 5FAF6018
P 10025 1825
F 0 "J14" H 10105 1771 50  0000 L CNN
F 1 "TB001-500-10BE" H 10105 1726 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TB001-500-10BE" H 10025 1825 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tb001-500.pdf" H 10025 1825 50  0001 C CNN
F 4 "102-6142-ND" H 10025 1825 50  0001 C CNN "DigikeyPart#"
F 5 "10 Position Wire to Board Terminal Block Horizontal with Board 0.197\" (5.00mm) Through Hole" H 10025 1825 50  0001 C CNN "Description"
	1    10025 1825
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2325 7250 2325
Text Label 7350 1425 0    50   ~ 0
SCL1
Text Label 7350 1525 0    50   ~ 0
SDA1
Text Label 7350 1625 0    50   ~ 0
AREF
Text Label 7350 1725 0    50   ~ 0
GND
Text Label 7350 1825 0    50   ~ 0
D13
Text Label 7350 1925 0    50   ~ 0
D12
Text Label 7350 2025 0    50   ~ 0
D11
Text Label 7350 2125 0    50   ~ 0
D10
Text Label 7350 2225 0    50   ~ 0
D9
Text Label 7350 2325 0    50   ~ 0
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
F 7 "SAM9303-ND" H 6300 1400 50  0001 C CNN "DigikeyPart#"
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
P 5650 6200
F 0 "J17" H 5500 7315 50  0000 C CNN
F 1 "ESQ-118-14-G-D" H 5500 7224 50  0001 C CNN
F 2 "SAMTEC_ESQ-118-14-G-D" H 5150 7350 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 5150 7500 50  0001 L BNN
F 4 "Samtec" H 5150 7500 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 5150 7350 50  0001 L BNN "Field5"
F 6 "36 Position Elevated Socket Connector Through Hole" H 5650 6200 50  0001 C CNN "Description"
F 7 "SAM9312-ND" H 5650 6200 50  0001 C CNN "DigikeyPart#"
	1    5650 6200
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x18 J18
U 1 1 5F8A937E
P 5550 5800
F 0 "J18" H 5475 6750 50  0000 L CNN
F 1 "102-TBL004V-508-18BE-2GY-ND" H 5630 5701 50  0001 L CNN
F 2 "lib_fp_pretty:CUI_TBL004V-508-18BE-2GY" H 5550 5800 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tbl004v-508.pdf" H 5550 5800 50  0001 C CNN
F 4 "Position Wire to Board Terminal Block" H 5550 5800 50  0001 C CNN "Description"
F 5 "102-TBL004V-508-18BE-2GY-ND" H 5550 5800 50  0001 C CNN "DigikeyPart#"
	1    5550 5800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x18 J16
U 1 1 5F8ADE81
P 5550 6900
F 0 "J16" H 5468 7917 50  0000 C CNN
F 1 "102-TBL004V-508-18BE-2GY-ND" H 5468 7826 50  0001 C CNN
F 2 "lib_fp_pretty:CUI_TBL004V-508-18BE-2GY" H 5550 6900 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/tbl004v-508.pdf" H 5550 6900 50  0001 C CNN
F 4 "Position Wire to Board Terminal Block" H 5550 6900 50  0001 C CNN "Description"
F 5 "102-TBL004V-508-18BE-2GY-ND" H 5550 6900 50  0001 C CNN "DigikeyPart#"
	1    5550 6900
	0    -1   1    0   
$EndComp
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
Text Label 1825 4375 3    50   ~ 0
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
F 7 "SAM9303-ND" H 6800 2600 50  0001 C CNN "DigikeyPart#"
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
Text Label 3975 3825 0    50   ~ 0
GND_
Text Label 3975 3725 0    50   ~ 0
MOSI_
Text Label 3975 3625 0    50   ~ 0
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
F 7 "SAM9303-ND" H 6100 3950 50  0001 C CNN "DigikeyPart#"
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
	1525 3875 1275 3875
Wire Wire Line
	1275 3875 1275 4525
Wire Wire Line
	1275 4525 1225 4525
$Comp
L F100_B200_Test_Bop_V2-rescue:ESQ-103-14-G-D-F100B200TestPanel J19
U 1 1 5F798B33
P 3725 3725
F 0 "J19" H 3600 4040 50  0000 C CNN
F 1 "ESQ-103-14-G-D" H 3600 3949 50  0000 C CNN
F 2 "SAMTEC_ESQ-103-14-G-D" H 3325 4075 50  0001 L BNN
F 3 "http://suddendocs.samtec.com/catalog_english/esq_th.pdf" H 3325 4075 50  0001 L BNN
F 4 "Samtec" H 3325 4075 50  0001 L BNN "Field4"
F 5 "Manufacturer Recommendations" H 3325 4075 50  0001 L BNN "Field5"
F 6 "6 Position Elevated Socket Connector Through Hole" H 3725 3725 50  0001 C CNN "Description"
F 7 "SAM9289-ND" H 3725 3725 50  0001 C CNN "DigikeyPart#"
	1    3725 3725
	1    0    0    -1  
$EndComp
Text Label 3225 3625 2    50   ~ 0
MISO_
Text Label 3225 3725 2    50   ~ 0
SCK_
Text Label 3225 3825 2    50   ~ 0
RESET_
Text Label 1375 4875 0    50   ~ 0
12VDC
Text Label 3150 1000 0    50   ~ 0
12VDC
Text Label 3225 1950 0    50   ~ 0
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
Text Notes 9500 4425 0    50   ~ 0
STAT_1
Text Notes 9500 4525 0    50   ~ 0
STAT_2
Text Notes 9500 4625 0    50   ~ 0
Power_On_Not
Text Notes 9500 4725 0    50   ~ 0
Plus_load
Wire Wire Line
	3000 1950 3225 1950
Connection ~ 3000 1950
Wire Wire Line
	3375 2700 3325 2700
Wire Wire Line
	3325 2700 3325 2500
Wire Wire Line
	9150 5000 9150 5900
Wire Wire Line
	7700 5900 9150 5900
Wire Wire Line
	7700 5450 7700 5900
Wire Wire Line
	9200 5100 9200 6075
Wire Wire Line
	9200 6075 7400 6075
Wire Wire Line
	7400 5550 7400 6075
Connection ~ 9000 2775
$Comp
L power:GND #PWR08
U 1 1 6041F643
P 9000 2775
F 0 "#PWR08" H 9000 2525 50  0001 C CNN
F 1 "GND" H 9005 2602 50  0000 C CNN
F 2 "" H 9000 2775 50  0001 C CNN
F 3 "" H 9000 2775 50  0001 C CNN
	1    9000 2775
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 2775 9150 2775
Wire Wire Line
	9150 2325 9150 2225
Wire Wire Line
	9150 2775 9150 2675
Connection ~ 9150 2375
$Comp
L Device:R R23
U 1 1 6041F651
P 8550 2575
F 0 "R23" H 8620 2621 50  0000 L CNN
F 1 "2.7k" H 8620 2530 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8480 2575 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8550 2575 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 8550 2575 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 8550 2575 50  0001 C CNN "DigikeyPart#"
	1    8550 2575
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 2375 9150 2375
$Comp
L Device:D D18
U 1 1 6041F65A
P 9150 2525
F 0 "D18" V 9104 2605 50  0000 L CNN
F 1 "1N4004-TP" V 9195 2605 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9150 2525 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9150 2525 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9150 2525 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9150 2525 50  0001 C CNN "Description"
	1    9150 2525
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q7
U 1 1 6041F662
P 8900 2575
F 0 "Q7" H 8950 2575 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9091 2530 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9100 2675 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 8900 2575 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 8900 2575 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 8900 2575 50  0001 C CNN "DigikeyPart#"
	1    8900 2575
	1    0    0    -1  
$EndComp
Connection ~ 9000 2325
$Comp
L power:GND #PWR06
U 1 1 6041F669
P 9000 2325
F 0 "#PWR06" H 9000 2075 50  0001 C CNN
F 1 "GND" H 9005 2152 50  0000 C CNN
F 2 "" H 9000 2325 50  0001 C CNN
F 3 "" H 9000 2325 50  0001 C CNN
	1    9000 2325
	0    1    1    0   
$EndComp
$Comp
L Device:R R22
U 1 1 6041F671
P 8550 2125
F 0 "R22" H 8620 2171 50  0000 L CNN
F 1 "2.7k" H 8620 2080 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8480 2125 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8550 2125 50  0001 C CNN
F 4 "RES 2.7K OHM 1/4W 1% AXIAL" H 8550 2125 50  0001 C CNN "Description"
F 5 "S2.7KCACT-ND" H 8550 2125 50  0001 C CNN "DigikeyPart#"
	1    8550 2125
	0    1    1    0   
$EndComp
Wire Wire Line
	9150 2325 9000 2325
$Comp
L Device:D D17
U 1 1 6041F67A
P 9150 2075
F 0 "D17" V 9104 2155 50  0000 L CNN
F 1 "1N4004-TP" V 9195 2155 50  0001 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9150 2075 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/1N4001-1N4007(DO-41).pdf" H 9150 2075 50  0001 C CNN
F 4 "1N4004-TPMSCT-ND" H 9150 2075 50  0001 C CNN "DigikeyPart#"
F 5 "Diode Standard 400V 1A Through Hole DO-41" H 9150 2075 50  0001 C CNN "Description"
	1    9150 2075
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_EBC Q6
U 1 1 6041F682
P 8900 2125
F 0 "Q6" H 8950 2125 50  0000 L CNN
F 1 "Q_NPN_EBC" H 9091 2080 50  0001 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 9100 2225 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/PZT3904-D.pdf" H 8900 2125 50  0001 C CNN
F 4 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 625mW Through Hole TO-92-3" H 8900 2125 50  0001 C CNN "Description"
F 5 "2N3904D26ZCT-ND" H 8900 2125 50  0001 C CNN "DigikeyPart#"
	1    8900 2125
	1    0    0    -1  
$EndComp
Wire Wire Line
	9825 2325 9825 3300
Wire Wire Line
	9125 3300 9825 3300
Wire Wire Line
	9825 2225 9725 2225
Wire Wire Line
	9725 2225 9725 2850
Wire Wire Line
	9725 2850 9125 2850
Wire Wire Line
	9825 2125 9650 2125
Wire Wire Line
	9650 2125 9650 2375
Wire Wire Line
	9150 2375 9650 2375
Wire Wire Line
	9825 2025 9450 2025
Wire Wire Line
	9450 2025 9450 1925
Wire Wire Line
	9450 1925 9150 1925
Connection ~ 9150 1925
Wire Wire Line
	9150 1925 9000 1925
Wire Wire Line
	7700 2325 7700 3500
Wire Wire Line
	7700 3500 8375 3500
Wire Wire Line
	7875 2225 7875 3050
Wire Wire Line
	7875 3050 8375 3050
Wire Wire Line
	7250 2225 7875 2225
Wire Wire Line
	8075 2125 8075 2575
Wire Wire Line
	8075 2575 8400 2575
Wire Wire Line
	7250 2125 8075 2125
Wire Wire Line
	8200 2025 8200 2125
Wire Wire Line
	8200 2125 8400 2125
Wire Wire Line
	7250 2025 8200 2025
$Comp
L Device:R R25
U 1 1 6049D710
P 9100 1700
F 0 "R25" V 8893 1700 50  0000 C CNN
F 1 "10k" V 8984 1700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9030 1700 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 9100 1700 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 9100 1700 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 9100 1700 50  0001 C CNN "DigikeyPart#"
	1    9100 1700
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D20
U 1 1 6049D718
P 8750 1900
F 0 "D20" H 8750 1775 50  0000 C CNN
F 1 "D_Zener" V 8795 1980 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8750 1900 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8750 1900 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8750 1900 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8750 1900 50  0001 C CNN "DigikeyPart#"
	1    8750 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R24
U 1 1 6049D728
P 8900 1400
F 0 "R24" V 8693 1400 50  0000 C CNN
F 1 "10k" V 8784 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8830 1400 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rnf_rnmf.pdf" H 8900 1400 50  0001 C CNN
F 4 "RES 10K OHM 1/4W 1% AXIAL" H 8900 1400 50  0001 C CNN "Description"
F 5 "RNF14FTD10K0CT-ND" H 8900 1400 50  0001 C CNN "DigikeyPart#"
	1    8900 1400
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D19
U 1 1 6049D730
P 8550 1600
F 0 "D19" H 8550 1475 50  0000 C CNN
F 1 "D_Zener" V 8595 1680 50  0001 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8550 1600 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N5221B-D.PDF" H 8550 1600 50  0001 C CNN
F 4 "DIODE ZENER 3.3V 500MW DO35" H 8550 1600 50  0001 C CNN "Description"
F 5 "1N5226BFSCT-ND" H 8550 1600 50  0001 C CNN "DigikeyPart#"
	1    8550 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8700 1400 8700 1600
Wire Wire Line
	8700 1400 8750 1400
Wire Wire Line
	8900 1700 8900 1900
Wire Wire Line
	8900 1700 8950 1700
$Comp
L power:GND #PWR014
U 1 1 6049D746
P 8600 1900
F 0 "#PWR014" H 8600 1650 50  0001 C CNN
F 1 "GND" H 8605 1727 50  0000 C CNN
F 2 "" H 8600 1900 50  0001 C CNN
F 3 "" H 8600 1900 50  0001 C CNN
	1    8600 1900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 6049D74C
P 8400 1600
F 0 "#PWR013" H 8400 1350 50  0001 C CNN
F 1 "GND" H 8405 1427 50  0000 C CNN
F 2 "" H 8400 1600 50  0001 C CNN
F 3 "" H 8400 1600 50  0001 C CNN
	1    8400 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 1925 8300 1700
Wire Wire Line
	8300 1700 8900 1700
Wire Wire Line
	7250 1925 8300 1925
Connection ~ 8900 1700
Wire Wire Line
	9250 1700 9550 1700
Wire Wire Line
	9550 1700 9550 1925
Wire Wire Line
	9550 1925 9825 1925
Wire Wire Line
	9050 1400 9250 1400
Wire Wire Line
	9250 1400 9250 1650
Wire Wire Line
	9250 1650 9625 1650
Wire Wire Line
	9625 1650 9625 1825
Wire Wire Line
	9625 1825 9825 1825
Wire Wire Line
	8125 1825 8125 1400
Wire Wire Line
	8125 1400 8700 1400
Wire Wire Line
	7250 1825 8125 1825
Connection ~ 8700 1400
Wire Wire Line
	8075 1725 8075 1100
Wire Wire Line
	8075 1100 9675 1100
Wire Wire Line
	9675 1100 9675 1725
Wire Wire Line
	9675 1725 9825 1725
Wire Wire Line
	7250 1725 8075 1725
Wire Wire Line
	9825 1625 9725 1625
Wire Wire Line
	9725 1625 9725 1050
Wire Wire Line
	9725 1050 8000 1050
Wire Wire Line
	8000 1050 8000 1625
Wire Wire Line
	7250 1625 8000 1625
Wire Wire Line
	7950 1525 7950 975 
Wire Wire Line
	7950 975  9775 975 
Wire Wire Line
	9775 975  9775 1525
Wire Wire Line
	9775 1525 9825 1525
Wire Wire Line
	7250 1525 7950 1525
Wire Wire Line
	9825 1425 9825 925 
Wire Wire Line
	9825 925  7875 925 
Wire Wire Line
	7875 925  7875 1425
Wire Wire Line
	7250 1425 7875 1425
Wire Wire Line
	9125 2850 8975 2850
Connection ~ 9125 2850
Text Label 1675 5175 0    50   ~ 0
BatSimulator
$EndSCHEMATC
