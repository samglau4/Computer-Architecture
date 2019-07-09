set_property -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS33} [get_ports {clk100MHz}]; 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk100MHz}];  

set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {reset}];  

set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {button}]; 

set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {EN}]; 

set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {wnr}];
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {in[3]}];
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {in[2]}]; 
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {in[1]}]; 
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {in[0]}]; 

set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {full}];
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {empty}];

set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {out[3]}];
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {out[2]}]; 
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {out[1]}]; 
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {out[0]}];
