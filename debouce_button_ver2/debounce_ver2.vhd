----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:44:32 08/03/2023 
-- Design Name: 
-- Module Name:    debounce_ver2 - Behavioral 
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

entity debounce_ver2 is
	port(
		CKHT: 		in 	std_logic;
		buttons: 	in 	std_logic_vector(1 downto 0);
		leds: 		out std_logic_vector(3 downto 0));
end debounce_ver2;

architecture Behavioral of debounce_ver2 is
	signal button_1: 	std_logic;
	signal rst: 		std_logic;
begin
	
	rst 		<= buttons(0);
	button_1 	<= buttons(1);

	IC: entity work.dem_4bits_btn
		port map(
				CKHT 	=> CKHT,
				rst 	=> rst,
				btn 	=> button_1,
				q 		=> leds);


end Behavioral;

