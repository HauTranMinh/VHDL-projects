----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:02 07/21/2023 
-- Design Name: 
-- Module Name:    hex_to_bcd_6bits - Behavioral 
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

entity hex_to_bcd_6bits is
	port(
		buttons: 	in 	std_logic_vector(5 downto 0);
		led: 		out std_logic_vector(7 downto 0));
end hex_to_bcd_6bits;

architecture Behavioral of hex_to_bcd_6bits is

begin
	IC: entity work.HEXTOBCD_6bits
		port map(
				sohex_6bits =>  buttons,
				chuc 		=> led(7 downto 4),
				donvi	 	=> led(3 downto 0));


end Behavioral;

