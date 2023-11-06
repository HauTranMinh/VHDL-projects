----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:42:38 07/22/2023 
-- Design Name: 
-- Module Name:    chia_10xung_ck1hz_ck10mhz - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chia_10xung_ck1hz_ck10mhz is
	port(
		clk: in 	std_logic;
		led: out	std_logic_vector(7 downto 0));
end chia_10xung_ck1hz_ck10mhz;

architecture Behavioral of chia_10xung_ck1hz_ck10mhz is

begin
	IC: entity work.CHIA_8XUNG
		port map(
				CKHT => clk,
				CK1HZ =>
				CK10HZ =>
				CK50HZ =>
				CK100HZ =>
				CK500HZ =>
				CK1000HZ =>
				CK5000HZ =>
				CK10000HZ =>
				CK500000HZ =>
				CK1MHZ =>);


end Behavioral;

