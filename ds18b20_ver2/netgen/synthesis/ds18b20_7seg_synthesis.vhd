--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: ds18b20_7seg_synthesis.vhd
-- /___/   /\     Timestamp: Fri Jul 21 12:09:06 2023
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm ds18b20_7seg -w -dir netgen/synthesis -ofmt vhdl -sim ds18b20_7seg.ngc ds18b20_7seg_synthesis.vhd 
-- Device	: xc6slx9-3-tqg144
-- Input file	: ds18b20_7seg.ngc
-- Output file	: C:\Users\Hau Tran\Desktop\vhdl\ds18b20_ver2\netgen\synthesis\ds18b20_7seg_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: ds18b20_7seg
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

entity ds18b20_7seg is
  port (
    swicth : in STD_LOGIC_VECTOR ( 5 downto 0 ); 
    anode : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    sseg : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end ds18b20_7seg;

architecture Structure of ds18b20_7seg is
  signal anode_0_OBUF_0 : STD_LOGIC; 
  signal anode_7_OBUF_1 : STD_LOGIC; 
begin
  XST_VCC : VCC
    port map (
      P => anode_0_OBUF_0
    );
  XST_GND : GND
    port map (
      G => anode_7_OBUF_1
    );
  anode_7_OBUF : OBUF
    port map (
      I => anode_7_OBUF_1,
      O => anode(7)
    );
  anode_6_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => anode(6)
    );
  anode_5_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => anode(5)
    );
  anode_4_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => anode(4)
    );
  anode_3_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => anode(3)
    );
  anode_2_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => anode(2)
    );
  anode_1_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => anode(1)
    );
  anode_0_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => anode(0)
    );
  sseg_7_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(7)
    );
  sseg_6_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(6)
    );
  sseg_5_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(5)
    );
  sseg_4_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(4)
    );
  sseg_3_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(3)
    );
  sseg_2_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(2)
    );
  sseg_1_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(1)
    );
  sseg_0_OBUF : OBUF
    port map (
      I => anode_0_OBUF_0,
      O => sseg(0)
    );

end Structure;

