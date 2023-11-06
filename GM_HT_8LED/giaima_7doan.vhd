----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:26 07/21/2023 
-- Design Name: 
-- Module Name:    giaima_7doan - Behavioral 
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

entity giaima_7doan is
	port(
		so_gma: 	in 	std_logic_vector(3 downto 0);
		sseg:		out std_logic_vector(6 downto 0));
end giaima_7doan;

architecture Behavioral of giaima_7doan is

begin
	process(so_gma)
	begin
		case( so_gma ) is
			when x"0" 	=> sseg <= "1000000";
			when x"1" 	=> sseg <= "1111001";
			when x"2" 	=> sseg <= "0100100";
			when x"3" 	=> sseg <= "0110000";
			when x"4" 	=> sseg <= "0011001";
			when x"5" 	=> sseg <= "0010010";
			when x"6" 	=> sseg <= "0000010";
			when x"7" 	=> sseg <= "1111000";
			when x"8" 	=> sseg <= "0000000";
			when x"9" 	=> sseg <= "0010000";
			when x"a" 	=> sseg <= "0001000";
			when x"b" 	=> sseg <= "0000011";
			when x"c" 	=> sseg <= "1000110";
			when x"d" 	=> sseg <= "0100001";
			when x"e" 	=> sseg <= "0000110";
			when others => sseg <= "0001110";
		end case ;
	end process;


end Behavioral;

