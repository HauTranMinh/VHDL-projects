----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:19 08/06/2023 
-- Design Name: 
-- Module Name:    dem_4digit_7doan - Behavioral 
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

entity dem_4digit_7doan is
	port(
		CKHT: 	in std_logic;
		btn0: 	in std_logic;
		sw0: 	in std_logic;
		sseg: 	out std_logic_vector(7 downto 0);
		anode: 	out std_logic_vector(7 downto 0));
end dem_4digit_7doan;

architecture Behavioral of dem_4digit_7doan is
	Signal ena_db, ena_1khz: std_logic;
	Signal temp_anode: std_logic_vector(3 downto 0);
	Signal rst: std_logic;
	Signal nghin, tram, chuc, donvi: std_logic_vector(3 downto 0);
	Signal s2b: std_logic_vector(1 downto 0);
	Signal so_gma: std_logic_vector(3 downto 0);
begin

	rst <= btn0;
	
	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
				CKHT 		=> CKHT,
				CK1HZ		=> ena_db,
				CK1KHZ 	=> ena_1khz);

	IC2: entity work.dem_4so
		port map(
				ena_db 	=> ena_db,
				ena_ss 	=> sw0,
				CKHT 	=> CKHT,
				rst 	=> rst,
				nghin 	=> nghin,
				tram 	=> tram,
				chuc 	=> chuc,
				donvi 	=> donvi);

	IC3: entity work.dem_2bits
		port map(
				ena1khz 	=> ena_1khz,
				CKHT 	=> CKHT,
				q 		=> s2b);

	IC4: entity work.dahop_4kenh
		port map(
				i0 	=> donvi,
				i1 	=> chuc,
				i2 	=> tram,
				i3 	=> nghin,
				s 	=> s2b,
				o 	=> so_gma);

	IC5: entity work.giaima_24h
		port map(
				i => s2b,
				o => temp_anode);

	IC6: entity work.giaima_7doan
		port map(
				so_gma 	=> so_gma,
				sseg 	=> sseg);

	anode <= temp_anode & "1111";
end Behavioral;

