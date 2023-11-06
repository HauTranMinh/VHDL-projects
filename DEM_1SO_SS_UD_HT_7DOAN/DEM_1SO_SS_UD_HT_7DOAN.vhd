----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:26 08/08/2023 
-- Design Name: 
-- Module Name:    DEM_1SO_SS_UD_HT_7DOAN - Behavioral 
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

entity DEM_1SO_SS_UD_HT_7DOAN is
	port(
		CKHT: in std_logic;
		btn: in std_logic;
		sw: in std_logic_vector(1 downto 0);
		sseg: out std_logic_vector(7 downto 0);
		anode: out std_logic_vector(7 downto 0));
end DEM_1SO_SS_UD_HT_7DOAN;

architecture Behavioral of DEM_1SO_SS_UD_HT_7DOAN is
	Signal ena_db, rst, ena1khz, ena_ss, ena_ud: std_logic;
	Signal donvi: std_logic_vector(3 downto 0);
begin
	rst <= btn;
	ena_ss <= sw(0);
	ena_ud <= sw(1);
	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
			CKHT 	   => CKHT,
			CK1KHZ 	=> ena1khz,
			CK1HZ 	=> ena_db);
		
	IC2: entity work.dem_1so_ssud
		port map(
			ena_db 	=> ena_db,
			CKHT 	=> CKHT,
			rst 	=> rst,
			ena_ss 	=> ena_ss,
			ena_ud 	=> ena_ud,
			donvi 	=> donvi);

	IC3: entity work.GM_HT_8LED
		port map(
			led70 		=> donvi,
			led71 		=> x"0",
			led72 		=> x"0",
			led73 		=> x"0",
			led74 		=> x"0",
			led75 		=> x"0",
			led76 		=> x"0",
			led77 		=> x"0",
			dc_8led 	=> x"ff",
			ena_8led 	=> x"e",
			ena1khz 	=> ena1khz,
			CKHT 		=> CKHT,
			sseg 		=> sseg,
			anode 		=> anode);


end Behavioral;

