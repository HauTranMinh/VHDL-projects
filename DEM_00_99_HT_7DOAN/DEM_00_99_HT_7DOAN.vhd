----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:24 08/04/2023 
-- Design Name: 
-- Module Name:    DEM_00_99_HT_7DOAN - Behavioral 
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

entity DEM_00_99_HT_7DOAN is
	port(
		CKHT: 	in 	std_logic;
		btn0: 	in 	std_logic;
		sw0: 	in 	std_logic;
		sseg: 	out std_logic_vector(7 downto 0);
		anode: 	out std_logic_vector(1 downto 0));
end DEM_00_99_HT_7DOAN;

architecture Behavioral of DEM_00_99_HT_7DOAN is
	Signal ena_db: 		std_logic;
	Signal rst: 		std_logic;
	Signal ena_1khz: 	std_logic;
	Signal s1b: 		std_logic;
	Signal chuc, donvi: std_logic_vector(3 downto 0);
	Signal so_gm: 		std_logic_vector(3 downto 0);
begin
----------------------------------------------------------------
	rst <= btn0;

----------------------------------------------------------------
	IC1: entity work.CHIA_10ENA
		port map(
				CKHT 		=> CKHT,
				ena_1hz 	=> ena_db,
				ena_1khz 	=> ena_1khz);
----------------------------------------------------------------
	IC2: entity work.dem_2so
		port map(
				ena_db 	=> ena_db,
				CKHT 	=> CKHT,
				rst		=> rst,
				ena_ss 	=> sw0,
				chuc 	=> chuc,
				donvi 	=> donvi);
----------------------------------------------------------------
	IC3: entity work.dem_1bit
		port map(
				ena_1khz 	=> ena_1khz,
				CKHT 		=> CKHT,
				q 			=> s1b);
----------------------------------------------------------------
	IC4: entity work.DAHOP_2KENH
		port map(
				s 		=> s1b,
				i1 	=> chuc,
				i0 	=> donvi,
				o 		=> so_gm);
----------------------------------------------------------------
	IC5: entity work.giaima_7doan
		port map(
				so_gm => so_gm,
				sseg => sseg);
----------------------------------------------------------------	
	IC6: entity work.giaima_12h
		port map(
				i => s1b,
				o => anode);
end Behavioral;

