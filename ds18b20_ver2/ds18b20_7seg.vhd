----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:53 07/21/2023 
-- Design Name: 
-- Module Name:    ds18b20_7seg - Behavioral 
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

entity ds18b20_7seg is
	port(
			clk: 		in 		std_logic;
			button_0: 	in 		std_logic;
			sw_0: 		in 		std_logic;
			anode: 		out 	std_logic;
			sseg: 		out		std_logic_vector(6 downto 0));
end ds18b20_7seg;

architecture Behavioral of ds18b20_7seg is
	signal ena_dp: 	std_logic;
	signal rst: 		std_logic;
	signal donvi: 		std_logic_vector(3 downto 0);
begin
	rst 	<= button_0;
	anode 	<= '1';

	IC1: entity work.chia_10ena
		port map(
				clk 	=> clk,
				ena1hz 	=> ena_dp);

	IC2: entity	work.dem_1so
		port map(
				clk => clk,
				rst => rst,
				ena_dp => ena_dp,
				ena_ss => sw_0,
				donvi => donvi);

	IC3: entity work.giaima_7doan
		port map(
				so_gma => donvi,
				sseg => sseg);


	
end Behavioral;

