----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:05:24 08/05/2023 
-- Design Name: 
-- Module Name:    dem_00_99_ht_7doan - Behavioral 
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

entity dem_00_99_ht_7doan is
	port(
		CKHT: 	in 	std_logic;
		btn0: 	in 	std_logic;
		sw0: 	in 	std_logic;
		anode: 	out std_logic_vector(7 downto 0);
		sseg: 	out std_logic_vector(7 downto 0));
end dem_00_99_ht_7doan;

architecture Behavioral of dem_00_99_ht_7doan is
	signal ena_db, ena1khz, rst: 	std_logic;
	signal donvi, chuc: 			std_logic_vector(3 downto 0);
	signal s1b: 					std_logic;
	signal so_gma: 					std_logic_vector(3 downto 0);
	signal temp_anode: 				std_logic_vector(1 downto 0);
begin
	
	rst <= btn0;

	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
			CKHT 	=> CKHT,
			CK1HZ 	=> ena_db,
			CK1KHZ => ena1khz);

	
	IC2: entity work.dem_2so
		port map(
			CKHT 	=> CKHT,
			ena_db 	=> ena_db,
			rst 	=> rst,
			ena_ss	=> sw0,
			donvi 	=> donvi,
			chuc 	=> chuc);

	IC3: entity work.dem_1bit
		port map(
			ena1khz => ena1khz,
			CKHT => CKHT,
			q => s1b);

	IC4: entity work.dahop_2kenh
		port map(
			i0 => donvi,
			i1 => chuc,
			s => s1b,
			o => so_gma);

	IC5: entity work.giaima_12h
		port map(
			i => s1b,
			o => temp_anode);

	IC6: entity work.giaima_7doan
		port map(
			so_gma 	=> so_gma,
			sseg 	=> sseg);

	anode <= temp_anode & "111111";
end Behavioral;

