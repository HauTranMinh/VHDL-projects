----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:48 07/15/2023 
-- Design Name: 
-- Module Name:    ROM_128x8_sync - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_128x8_sync is
	port(
			data_out: 	out std_logic_vector(7 downto 0);
			address: 	in 	std_logic_vector(6 downto 0);
			clock: 		in 	std_logic);
end ROM_128x8_sync;

architecture Behavioral of ROM_128x8_sync is
	type instmem is array (0 to 127) of std_logic_vector(7 downto 0);
	signal ROM: instmem := (
							x"86",x"AA",x"87",x"80",-- 0x00: (empty location)
							x"88",x"44",x"89",x"81",-- 0x04: (empty location)
							x"96",x"82",x"97",x"83",-- 0x08: (empty location)
							x"42",x"43",x"44",x"45",-- 0x0C: (empty location)
							x"46",x"47",x"48",x"49",-- 0x10: (empty location)
							x"27",x"00",x"28",x"00",-- 0x14: (empty location)
							x"00",x"00",x"00",x"00",-- 0x18: (empty location)
							x"00",x"00",x"00",x"00",-- 0x1C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x20: (empty location)
							x"00",x"00",x"00",x"00",-- 0x24: (empty location)
							x"00",x"00",x"00",x"00",-- 0x28: (empty location)
							x"00",x"00",x"00",x"00",-- 0x2C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x30: (empty location)
							x"00",x"00",x"00",x"00",-- 0x34: (empty location)
							x"00",x"00",x"00",x"00",-- 0x38: (empty location)
							x"00",x"00",x"00",x"00",-- 0x3C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x40: (empty location)
							x"00",x"00",x"00",x"00",-- 0x44: (empty location)
							x"00",x"00",x"00",x"00",-- 0x48: (empty location)
							x"00",x"00",x"00",x"00",-- 0x4C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x50: (empty location)
							x"00",x"00",x"00",x"00",-- 0x54: (empty location)
							x"00",x"00",x"00",x"00",-- 0x58: (empty location)
							x"00",x"00",x"00",x"00",-- 0x5C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x60: (empty location)
							x"00",x"00",x"00",x"00",-- 0x64: (empty location)
							x"00",x"00",x"00",x"00",-- 0x68: (empty location)
							x"00",x"00",x"00",x"00",-- 0x6C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x70: (empty location)
							x"00",x"00",x"00",x"00",-- 0x74: (empty location)
							x"00",x"00",x"00",x"00",-- 0x78: (empty location)
							x"00",x"00",x"00",x"00" -- 0x7C: (empty location)
							);
begin

	process(clock)
		if (rising_edge(clock)) then
				data_out <= ROM(conv_integer(unsigned(address)));
		end if ;	
end process;
end Behavioral;

