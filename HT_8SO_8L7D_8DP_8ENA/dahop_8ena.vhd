----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:36:12 08/08/2023 
-- Design Name: 
-- Module Name:    dahop_8ena - Behavioral 
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

entity dahop_8ena is
	port(
		s: 	in 	std_logic_vector(2 downto 0);
		i8: in 	std_logic_vector(3 downto 0);
		o: 	out std_logic);
end dahop_8ena;

architecture Behavioral of dahop_8ena is

begin
	process(s, i8)
		begin
			case( s ) is
				when "000" 	=> o <= i8(0);
			 	when "001" 	=> o <= i8(1);
			 	when "010" 	=> o <= i8(2);
			 	when "011" 	=> o <= i8(3);
			 	when "100" 	=> o <= i8(0);
			 	when "101" 	=> o <= i8(1);
			 	when "110" 	=> o <= i8(2);
			 	when others => o <= i8(3);
			end case ;
		end process;

end Behavioral;

