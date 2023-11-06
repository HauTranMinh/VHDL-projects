----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:06:28 08/08/2023 
-- Design Name: 
-- Module Name:    giaima_7doan_ena - Behavioral 
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

entity giaima_7doan_ena is
	port(
		so_gma: in 	std_logic_vector(3 downto 0);
		ena: 	in 	std_logic;
		dp: 	in 	std_logic;
		sseg: 	out std_logic_vector(7 downto 0));
end giaima_7doan_ena;

architecture Behavioral of giaima_7doan_ena is
	Signal ss7: std_logic_vector(6 downto 0);
	Signal ss8: std_logic_vector(7 downto 0);
begin
	
	ss8 <= dp & ss7; -- need to review -- 

	sseg <= ss8 when ena = '1' else x"00";


	process(so_gma)
	begin
		case( so_gma ) is
			when x"0" 	=> ss7 <= "1000000";
			when x"1" 	=> ss7 <= "1111001";
			when x"2" 	=> ss7 <= "0100100";
			when x"3" 	=> ss7 <= "0110000";
			when x"4" 	=> ss7 <= "0011001";
			when x"5" 	=> ss7 <= "0010010";
			when x"6" 	=> ss7 <= "0000010";
			when x"7" 	=> ss7 <= "1111000";
			when x"8" 	=> ss7 <= "0000000";
			when x"9" 	=> ss7 <= "0010000";
			when x"a" 	=> ss7 <= "0011100";
			when x"b" 	=> ss7 <= "0000011";
			when x"c" 	=> ss7 <= "1000110";
			when x"d" 	=> ss7 <= "0100001";
			when x"e" 	=> ss7 <= "0000110";
			when others => ss7 <= "0001110";
		end case ;
	end process;

end Behavioral;

