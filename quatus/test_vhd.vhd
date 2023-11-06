----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:22 06/22/2023 
-- Design Name: 
-- Module Name:    basic - Behavioral 
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

entity basic is
	Generic(
			number_of_buttons : integer:=4);
	port(
			buttons_in: in std_logic_vector(number_of_buttons - 1 downto 0);
			enable: in std_ulogic;
			led_out: out std_logic_vector(number_of_buttons - 1 downto 0));
end basic;

architecture Behavioral of basic is

begin
	
	led_out <= buttons_in when enable = '0' else (others => '0');
	

end Behavioral;

