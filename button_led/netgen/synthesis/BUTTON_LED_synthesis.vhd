--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: BUTTON_LED_synthesis.vhd
-- /___/   /\     Timestamp: Fri Jul 07 11:30:00 2023
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm BUTTON_LED -w -dir netgen/synthesis -ofmt vhdl -sim BUTTON_LED.ngc BUTTON_LED_synthesis.vhd 
-- Device	: xc6slx9-3-tqg144
-- Input file	: BUTTON_LED.ngc
-- Output file	: C:\Users\Hau Tran\Desktop\vhdl\button_led\netgen\synthesis\BUTTON_LED_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: BUTTON_LED
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity BUTTON_LED is
  port (
    enable : in STD_LOGIC := 'X'; 
    button : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    led_out : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end BUTTON_LED;

architecture Structure of BUTTON_LED is
  signal button_3_IBUF_0 : STD_LOGIC; 
  signal button_2_IBUF_1 : STD_LOGIC; 
  signal button_1_IBUF_2 : STD_LOGIC; 
  signal button_0_IBUF_3 : STD_LOGIC; 
  signal enable_IBUF_4 : STD_LOGIC; 
  signal led_out_3_OBUF_5 : STD_LOGIC; 
  signal led_out_2_OBUF_6 : STD_LOGIC; 
  signal led_out_1_OBUF_7 : STD_LOGIC; 
  signal led_out_0_OBUF_8 : STD_LOGIC; 
begin
  Mmux_led_out41 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => enable_IBUF_4,
      I1 => button_3_IBUF_0,
      O => led_out_3_OBUF_5
    );
  Mmux_led_out31 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => enable_IBUF_4,
      I1 => button_2_IBUF_1,
      O => led_out_2_OBUF_6
    );
  Mmux_led_out21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => enable_IBUF_4,
      I1 => button_1_IBUF_2,
      O => led_out_1_OBUF_7
    );
  Mmux_led_out11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => enable_IBUF_4,
      I1 => button_0_IBUF_3,
      O => led_out_0_OBUF_8
    );
  button_3_IBUF : IBUF
    port map (
      I => button(3),
      O => button_3_IBUF_0
    );
  button_2_IBUF : IBUF
    port map (
      I => button(2),
      O => button_2_IBUF_1
    );
  button_1_IBUF : IBUF
    port map (
      I => button(1),
      O => button_1_IBUF_2
    );
  button_0_IBUF : IBUF
    port map (
      I => button(0),
      O => button_0_IBUF_3
    );
  enable_IBUF : IBUF
    port map (
      I => enable,
      O => enable_IBUF_4
    );
  led_out_3_OBUF : OBUF
    port map (
      I => led_out_3_OBUF_5,
      O => led_out(3)
    );
  led_out_2_OBUF : OBUF
    port map (
      I => led_out_2_OBUF_6,
      O => led_out(2)
    );
  led_out_1_OBUF : OBUF
    port map (
      I => led_out_1_OBUF_7,
      O => led_out(1)
    );
  led_out_0_OBUF : OBUF
    port map (
      I => led_out_0_OBUF_8,
      O => led_out(0)
    );

end Structure;

