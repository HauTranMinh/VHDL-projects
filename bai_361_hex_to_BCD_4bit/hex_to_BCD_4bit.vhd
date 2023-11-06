----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:49 07/21/2023 
-- Design Name: 
-- Module Name:    hex_to_BCD_4bit - Behavioral 
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

entity hex_to_BCD_4bit is
	port(
		sw: 	in 	std_logic_vector(3 downto 0);
		led: 			out std_logic_vector(7 downto 0));
end hex_to_BCD_4bit;

architecture Behavioral of hex_to_BCD_4bit is

begin
	IC: entity work.HEXTOBCD_4bit
		port map(
				sohex_4bit 		=> sw,
				chuc 				=> led(7 downto 4),
				donvi 			=> led(3 downto 0));


end Behavioral;

