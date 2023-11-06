----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:46 08/07/2023 
-- Design Name: 
-- Module Name:    giaima_38h - Behavioral 
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

entity giaima_38h is
	port(
		i: in 	std_logic_vector(2 downto 0);
		o: out 	std_logic_vector(7 downto 0));
end giaima_38h;

architecture Behavioral of giaima_38h is
	
begin
	process(i)
	begin
		case( i ) is
		
			when "000" 	=> o <= "11111110";
			when "001" 	=> o <= "11111101";
			when "010" 	=> o <= "11111011";
			when "011" 	=> o <= "11110111";
			when "100" 	=> o <= "11101111";
			when "101" 	=> o <= "11011111";
			when "110" 	=> o <= "10111111";	
			when others => o <= "01111111";
		
		end case ;
	end	process;

end Behavioral;

