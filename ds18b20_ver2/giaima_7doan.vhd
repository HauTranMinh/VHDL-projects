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
		sseg:		out std_logic_vector(7 downto 0));
end giaima_7doan;

architecture Behavioral of giaima_7doan is

begin
	process(so_gma)
	begin
		case( so_gma ) is
			when x"0" 	=> sseg <= x"c0";
			when x"1" 	=> sseg <= x"f9";
			when x"2" 	=> sseg <= x"a4";
			when x"3" 	=> sseg <= x"b0";
			when x"4" 	=> sseg <= x"99";
			when x"5" 	=> sseg <= x"92";
			when x"6" 	=> sseg <= x"82";
			when x"7" 	=> sseg <= x"f8";
			when x"8" 	=> sseg <= x"80";
			when x"9" 	=> sseg <= x"90";
			when x"a" 	=> sseg <= x"88";
			when x"b" 	=> sseg <= x"83";
			when x"c" 	=> sseg <= x"c6";
			when x"d" 	=> sseg <= x"a1";
			when x"e" 	=> sseg <= x"86";
			when others => sseg <= x"8e";
		end case ;
	end process;


end Behavioral;

