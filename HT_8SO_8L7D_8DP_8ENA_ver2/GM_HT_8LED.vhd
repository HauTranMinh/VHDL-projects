----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:44 08/08/2023 
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
		CKHT: 		in std_logic;
		ena1khz: 	in std_logic;
		led70: 		in std_logic_vector(3 downto 0);
		led71: 		in std_logic_vector(3 downto 0);
		led72: 		in std_logic_vector(3 downto 0);
		led73: 		in std_logic_vector(3 downto 0);
		led74: 		in std_logic_vector(3 downto 0);
		led75: 		in std_logic_vector(3 downto 0);
		led76: 		in std_logic_vector(3 downto 0);
		led77: 		in std_logic_vector(3 downto 0);
		dc_8led: 	in std_logic_vector(7 downto 0);
		ena_8led: 	in std_logic_vector(7 downto 0);
		anode: 		out std_logic_vector(7 downto 0);
		sseg: 		out std_logic_vector(7 downto 0));
end GM_HT_8LED;

architecture Behavioral of GM_HT_8LED is
	Signal s3b: std_logic_vector(2 downto 0);
	Signal so_gma: std_logic_vector(3 downto 0);
	Signal dc_1led: std_logic;
	Signal ena_2led: std_logic;
begin
	
	K1: entity work.dem_3bits
		port map(
			ena1khz => ena1khz,
			CKHT 	=> CKHT,
			q 		=> s3b);

	K2: entity work.giaima_38h
		port map(
			i => s3b,
			o => anode);

	K3: entity work.dahop_8kenh
		port map(
			s 		=> s3b,
			dc8 	=> dc_8led,
			dc1 	=> dc_1led,
			ena8 	=> ena_8led,
			ena2 	=> ena_2led,
			i0 	=> led70,
			i1 	=> led71,
			i2 	=> led72,
			i3 	=> led73,
			i4 	=> led74,
			i5 	=> led75,
			i6 	=> led76,
			i7 	=> led77,
			o 	=> so_gma);

	K4: entity work.giaima_7doan_ena
		port map(
			so_gma 	=> so_gma,
			dp 		=> dc_1led,
			ena 	=> ena_2led,
			sseg 	=> sseg);
end Behavioral;

