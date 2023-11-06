----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:33 08/07/2023 
-- Design Name: 
-- Module Name:    GM_HT_8LED - Behavioral 
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

entity GM_HT_8LED is
	port(
		ena1khz: 	in 	std_logic;
		CKHT: 		in 	std_logic;
		led70: 		in 	std_logic_vector(3 downto 0);
		led71: 		in 	std_logic_vector(3 downto 0);
		led72: 		in 	std_logic_vector(3 downto 0);
		led73: 		in 	std_logic_vector(3 downto 0);
		led74: 		in 	std_logic_vector(3 downto 0);
		led75: 		in 	std_logic_vector(3 downto 0);
		led76: 		in 	std_logic_vector(3 downto 0);
		led77: 		in 	std_logic_vector(3 downto 0);
		sseg: 		out std_logic_vector(6 downto 0);
		anode: 		out std_logic_vector(7 downto 0));
end GM_HT_8LED;

architecture Behavioral of GM_HT_8LED is
	Signal so_gma: 	std_logic_vector(3 downto 0);
	Signal s3b: 	std_logic_vector(2 downto 0);
begin
	IC1: entity work.dahop_8kenh
		port map(
			i0 => led73,
			i1 => led72,
			i2 => led71,
			i3 => led70,
			i4 => led77,
			i5 => led76,
			i6 => led75,
			i7 => led74,
			s => s3b,
			o => so_gma);

	IC2: entity work.dem_3bits
		port map(
			ena1khz => ena1khz,
			CKHT 	=> CKHT,
			q 		=> s3b);

	IC3: entity work.giaima_38h
		port map(
			i => s3b,
			o => anode);

	IC4: entity work.giaima_7doan
		port map(
			so_gma 	=> so_gma,
			sseg 	=> sseg);

end Behavioral;

