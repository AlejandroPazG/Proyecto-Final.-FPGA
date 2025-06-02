## ===========================================
## RELOJ PRINCIPAL DE LA BASYS 3 (100 MHz)
## ===========================================
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk -waveform {0 5} [get_ports clk]

## ===========================================
## RELOJ DIVIDIDO (1 Hz desde prescaler)
## ===========================================

## ===========================================
## BOTÓN DE RESET (BTN0)
## ===========================================
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## ===========================================
## SWITCHES DE CONTROL
## ===========================================
# SW0 → Iniciar llenado
set_property PACKAGE_PIN V17 [get_ports startfill]
set_property IOSTANDARD LVCMOS33 [get_ports startfill]

# SW1 → Producto detectado (productook)
set_property PACKAGE_PIN V16 [get_ports productook]
set_property IOSTANDARD LVCMOS33 [get_ports productook]

## ===========================================
## SALIDAS DE ESTADO A LEDS
## ===========================================
# LED0 → llenando
set_property PACKAGE_PIN U16 [get_ports llenando]
set_property IOSTANDARD LVCMOS33 [get_ports llenando]

# LED1 → sellando
set_property PACKAGE_PIN E19 [get_ports sellando]
set_property IOSTANDARD LVCMOS33 [get_ports sellando]

# LED2 → LED encendido al finalizar sellado
set_property PACKAGE_PIN U19 [get_ports LED]
set_property IOSTANDARD LVCMOS33 [get_ports LED]

## ===========================================
## ESTADO DE LA FSM MOORE (llenado) - LED3 a LED5
## ===========================================
set_property PACKAGE_PIN V19 [get_ports state_filler[0]]
set_property IOSTANDARD LVCMOS33 [get_ports state_filler[0]]

set_property PACKAGE_PIN W18 [get_ports state_filler[1]]
set_property IOSTANDARD LVCMOS33 [get_ports state_filler[1]]

set_property PACKAGE_PIN U15 [get_ports state_filler[2]]
set_property IOSTANDARD LVCMOS33 [get_ports state_filler[2]]

## ===========================================
## ESTADO DE LA FSM MEALY (sellado) - LED6 a LED8
## ===========================================
set_property PACKAGE_PIN V15 [get_ports state_sealer[0]]
set_property IOSTANDARD LVCMOS33 [get_ports state_sealer[0]]

set_property PACKAGE_PIN W15 [get_ports state_sealer[1]]
set_property IOSTANDARD LVCMOS33 [get_ports state_sealer[1]]

set_property PACKAGE_PIN V14 [get_ports state_sealer[2]]
set_property IOSTANDARD LVCMOS33 [get_ports state_sealer[2]]
