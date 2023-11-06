----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:39 08/03/2023 
-- Design Name: 
-- Module Name:    DK_8LED_STD_PST - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DK_8LED_STD_PST is
	port(
		CKHT: 	in 	std_logic;
		btn: 	in 	std_logic;
		sw: 	in 	std_logic;
		leds: 	out	std_logic_vector(7 downto 0));
end DK_8LED_STD_PST;

architecture Behavioral of DK_8LED_STD_PST is
	Signal ena_db, rst: std_logic;
	Signal q_js_pst: std_logic_vector(7 downto 0);
begin
	rst <= btn;
	leds <= q_js_pst;

	IC1: entity work.CHIA_ENA1HZ_MODULE
		port map(
				CKHT 	=> CKHT,
				ena1hz 	=> ena_db);

	IC2: entity work.JS_PST
		port map(
				ena_db 	=> ena_db,
				CKHT 	=> CKHT,
				rst 	=> rst,
				oe 		=> sw,
				q 		=> q_js_pst);

end Behavioral;

