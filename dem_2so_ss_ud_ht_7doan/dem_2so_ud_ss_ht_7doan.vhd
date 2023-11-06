----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:44 08/13/2023 
-- Design Name: 
-- Module Name:    dem_2so_ud_ss_ht_7doan - Behavioral 
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

entity dem_2so_ud_ss_ht_7doan is
	port(
		CKHT: 	in 	std_logic;
		btn: 	in 	std_logic;
		sw: 	in 	std_logic_vector(2 downto 0);
		anode: 	out std_logic_vector(7 downto 0);
		sseg: 	out std_logic_vector(7 downto 0));
end dem_2so_ud_ss_ht_7doan;

architecture Behavioral of dem_2so_ud_ss_ht_7doan is
	Signal ena_db: std_logic;
	Signal ena1khz: std_logic;
	Signal ena1hz: std_logic;
	Signal ena5hz: std_logic;
----------------------------------------------------------
	Signal rst: std_logic;
	Signal chuc, donvi: std_logic_vector(3 downto 0);
----------------------------------------------------------
	Signal dc_8led, ena_8led: std_logic_vector(7 downto 0);
begin
	rst <= btn;
	dc_8led <= x"ff";
	ena_8led <= x"ff";

	ena_db <= ena1hz when sw(2) = '0' else ena5hz;

	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
			CKHT => CKHT,
			CK1HZ => ena1hz,
			CK5HZ => ena5hz,
			CK1KHZ => ena1khz); 

	IC2: entity work.dem_2so_ss_ud
		port map(
			ena_db 	=> ena_db,
			ena_ss 	=> sw(0),
			ena_ud 	=> sw(1),
			rst 	=> rst,
			CKHT 	=> CKHT,
			chuc 	=> chuc,
			donvi 	=> donvi);

	IC3: entity work.GM_HT_8LED
		port map(
			CKHT => CKHT,
			ena1khz => ena1khz,
			ena_8led => ena_8led,
			dc_8led => dc_8led,
			led70 => chuc,
			led71 => donvi,
			led72 => x"a",
			led73 => x"c",
			led74 => chuc,
			led75 => donvi,
			led76 => x"a",
			led77 => x"c",
			sseg => sseg,
			anode => anode);
end Behavioral;

