----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:19 08/12/2023 
-- Design Name: 
-- Module Name:    DEM_1SO_SSUD_HT_7DOAN - Behavioral 
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

entity DEM_1SO_SSUD_HT_7DOAN is
	port(
		CKHT: 	in 	std_logic;
		btn: 	in 	std_logic;
		sw: 	in 	std_logic_vector(1 downto 0);
		sseg: 	out std_logic_vector(7 downto 0);
		anode: 	out std_logic_vector(7 downto 0));
end DEM_1SO_SSUD_HT_7DOAN;

architecture Behavioral of DEM_1SO_SSUD_HT_7DOAN is
	Signal ena1khz: std_logic;
	Signal rst: std_logic;
	Signal ena_db: std_logic;
	Signal donvi: std_logic_vector(3 downto 0);
	Signal dc_8led: std_logic_vector(7 downto 0);
	Signal ena_8led: std_logic_vector(3 downto 0);
begin

	rst <= btn;
	dc_8led <= x"ff";
	ena_8led <= x"8";
	
	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
			CKHT 	=> CKHT,
			CK1HZ 	=> ena_db,
			CK1KHZ => ena1khz);

	IC2: entity work.dem_1so_ss_ud
		port map(
			ena_db 	=> ena_db,
			CKHT 	=> CKHT,
			rst 	=> rst,
			ena_ss 	=> sw(0),
			ena_ud 	=> sw(1),
			donvi 	=> donvi);

	IC3: entity work.GM_HT_8LED
		port map(
			led70 => x"0",
			led71 => x"1",
			led72 => x"2",
			led73 => donvi,
			led74 => x"4",
			led75 => x"5",
			led76 => x"6",
			led77 => x"7",
			dc_8led => dc_8led,
			ena_8led => ena_8led,
			CKHT => CKHT,
			ena1khz => ena1khz,
			sseg => sseg,
			anode => anode);


end Behavioral;

