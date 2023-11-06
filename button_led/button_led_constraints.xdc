## switches

set_property -dict { PACKAGE_PIN P74    IOSTANDARD LVCMOS33 } [get_ports { enable }]; 

## LEDS

set_property -dict { PACKAGE_PIN P93    IOSTANDARD LVCMOS33 } [get_ports { led_out[0] }]; 
set_property -dict { PACKAGE_PIN P94    IOSTANDARD LVCMOS33 } [get_ports { led_out[1] }]; 
set_property -dict { PACKAGE_PIN P95    IOSTANDARD LVCMOS33 } [get_ports { led_out[2] }]; 
set_property -dict { PACKAGE_PIN P97    IOSTANDARD LVCMOS33 } [get_ports { led_out[3] }]; 

## BUTTONS

set_property -dict { PACKAGE_PIN P56    IOSTANDARD LVCMOS33 } [get_ports { button[0] }]; 
set_property -dict { PACKAGE_PIN P57    IOSTANDARD LVCMOS33 } [get_ports { button[1] }]; 
set_property -dict { PACKAGE_PIN P58    IOSTANDARD LVCMOS33 } [get_ports { button[2] }]; 
set_property -dict { PACKAGE_PIN P59    IOSTANDARD LVCMOS33 } [get_ports { button[3] }]; 

