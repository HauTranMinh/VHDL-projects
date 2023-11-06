----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:33 08/07/2023 
-- Design Name: 
-- Module Name:    hai_ma_bcd_4so_led_7doan - Behavioral 
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

entity hai_ma_bcd_4so_led_7doan is
	port(
		CKHT: 	in 	std_logic;
		btn: 		in 	std_logic_vector(1 downto 0);
		sw: 		in 	std_logic_vector(1 downto 0);
		anode: 	out 	std_logic_vector(7 downto 0);
		sseg: 	out 	std_logic_vector(7 downto 0));
end hai_ma_bcd_4so_led_7doan;

architecture Behavioral of hai_ma_bcd_4so_led_7doan is
	Signal ena_db, ena1khz: 			 std_logic;
	Signal rst1, rst2: 					 std_logic;
	Signal donvi1, chuc1, tram1, nghin1: std_logic_vector(3 downto 0);
	Signal donvi2, chuc2, tram2, nghin2: std_logic_vector(3 downto 0);
	Signal so_gma: 						 std_logic_vector(3 downto 0);
	Signal s3b: 						 std_logic_vector(2 downto 0);
begin
	
	rst1 <= btn(0);
	rst2 <= btn(1);

	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
			CKHT 	=> CKHT,
			CK1HZ 	=> ena_db,
			CK1KHZ 	=> ena1khz);

	IC2: entity work.dem_4so1
		port map(
			ena_db 	=> ena_db,
			ena_ss 	=> sw(0),
			CKHT 	=> CKHT,
			rst 	=> rst1,
			donvi 	=> donvi1,
			chuc 	=> chuc1,
			tram 	=> tram1,
			nghin 	=> nghin1);
	
	IC3: entity work.dem_4so2
		port map(
			ena_db 	=> ena_db,
			ena_ss 	=> sw(1),
			CKHT 	=> CKHT,
			rst 	=> rst2,
			donvi 	=> donvi2,
			chuc 	=> chuc2,
			tram 	=> tram2,
			nghin 	=> nghin2);

	IC4: entity work.dem_3bits
		port map(
			ena1khz => ena1khz,
			CKHT 	=> CKHT,
			q 		=> s3b);

	IC5: entity work.dahop_8kenh
		port map(
			i0 => donvi1,
			i1 => chuc1,
			i2 => tram1,
			i3 => nghin1,
			i4 => donvi2,
			i5 => chuc2,
			i6 => tram2,
			i7 => nghin2,
			s => s3b,
			o => so_gma);

	IC6: entity work.giaima_7doan
		port map(
			so_gma => so_gma,
			sseg => sseg);

	IC7: entity work.giaima_38h
		port map(
			i => s3b,
			o => anode);
		
end Behavioral;

