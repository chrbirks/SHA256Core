## Generated SDC file "C:/Users/chrbirks/Dropbox/Projekter/FPGA/sandbox/timing_constraints/sandbox.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

## DATE    "Tue Mar 15 21:24:47 2016"

##
## DEVICE  "EP4CE22F17C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

#derive_pll_clocks -create_base_clocks # Erstatter create_clock... og create_generated_clock...

create_clock -name {clk_50mhz} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk_50mhz}]
create_clock -name {clk_50mhz_ext} -period 20.000 -waveform { 0.000 10.000 } 

#**************************************************************
# Create Generated Clock
#**************************************************************

# Erstatter create_generated_clock
derive_pll_clocks

#create_generated_clock \
-name {clk_100mhz} \
-source [get_pins {i_pll|altpll_component|auto_generated|pll1|inclk[0]}] \
-duty_cycle 50.000 \
-multiply_by 2 \
-master_clock {clk_50mhz} [get_pins {i_pll|altpll_component|auto_generated|pll1|clk[0]}] 

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************

#set_input_delay -clock [get_clocks clk_50mhz_ext] -min 2.000 [get_ports {a[*] b[*] reset_n}]
#set_input_delay -clock [get_clocks clk_50mhz_ext] -min -1.000 [get_ports {a[*] b[*] reset_n}]
#set_input_delay -clock [get_clocks clk_50mhz_ext] -max 3.000 [get_ports {a[*] b[*] reset_n}]
#set_input_delay -clock [get_clocks clk_50mhz_ext] -max 4.000 [get_ports {a[*] b[*] reset_n}]

#**************************************************************
# Set Output Delay
#**************************************************************

#set_output_delay -clock [get_clocks clk_50mhz_ext] -min 1.000 [get_ports leds[*]]
set_output_delay -clock [get_clocks clk_50mhz_ext] -min -1.000 [get_ports leds[*]]
#set_output_delay -clock [get_clocks clk_50mhz_ext] -max 1.500 [get_ports leds[*]]
set_output_delay -clock [get_clocks clk_50mhz_ext] -max 4.000 [get_ports leds[*]]

#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous \
-group [get_clocks {clk_50mhz clk_50mhz_ext}] \
-group [get_clocks {i_pll|altpll_component|auto_generated|pll1|clk[0]}]

#**************************************************************
# Set False Path
#**************************************************************

#set_false_path -from [get_ports {a* b* reset_n}] -to *
#set_false_path -from * -to [get_ports leds*]

#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_ports {a[*] b[*]}] -to [get_ports {leds[*]}] 20.000

#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_ports {a[*] b[*]}] -to [get_ports {leds[*]}] 1.000

#**************************************************************
# Set Input Transition
#**************************************************************

