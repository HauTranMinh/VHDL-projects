----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:12 08/04/2023 
-- Design Name: 
-- Module Name:    dem_0_9_ht_7doan - Behavioral 
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

entity dem_0_9_ht_7doan is
	port(
		CKHT: 	in std_logic;
		btn0: 	in std_logic;
		sw0: 		in std_logic;
		sseg: 	out std_logic_vector(7 downto 0);
		anode: 	out std_logic_vector(7 downto 0));
end dem_0_9_ht_7doan;

architecture Behavioral of dem_0_9_ht_7doan is
	signal ena_db: std_logic;
	signal rst: std_logic;
	signal donvi: std_logic_vector(3 downto 0);
begin

	rst <= btn0;
	IC1: entity work.CHIA_ENA1HZ_MODULE
		port map(
				CKHT => CKHT,
				ena1hz => ena_db);

	IC2: entity work.dem_1so
		port map(
				CKHT => CKHT,
				rst => rst,
				ena_db => ena_db,
				ena_ss => sw0,
				donvi	=> donvi);

	IC3: entity work.giaima_7doan
		port map(
				so_gma => donvi,
				sseg => sseg);

	anode <= x"7f";
end Behavioral;

