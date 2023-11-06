----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:51 08/03/2023 
-- Design Name: 
-- Module Name:    DEM_4BITS_UP_DOWN_2BTNS - Behavioral 
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

entity DEM_4BITS_UP_DOWN_2BTNS is
	port(
		buttons: 	in 	std_logic_vector(2 downto 0);
		CKHT: 		in 	std_logic;
		leds: 		out std_logic_vector(3 downto 0));
end DEM_4BITS_UP_DOWN_2BTNS;

architecture Behavioral of DEM_4BITS_UP_DOWN_2BTNS is
begin
	
	IC: entity work.dem_4bits_up_down_2btns_module
		port map(
				CKHT => CKHT,
				rst => buttons(0),
				btn_up => 	NOT buttons(1),
				btn_down => NOT buttons(2),
				q => leds);
end Behavioral;

