----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:35 07/21/2023 
-- Design Name: 
-- Module Name:    decode_sseg_dp - Behavioral 
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

entity decode_sseg_dp is
	port(
		data_sseg: 	in std_logic_vector(3 downto 0);
		enable: 		in std_logic;
		dp: 			in std_logic;
		sseg: 		out std_logic_vector(7 downto 0));
end decode_sseg_dp;

architecture Behavioral of decode_sseg_dp is
Signal ss: std_logic_vector(6 downto 0);
begin
	
	
	process(data_sseg, enable)
	begin
		if enable = '0' then
			sseg <= x"ff"; --turn off -- 
		else
			case( data_sseg ) is
			
				when x"0" 	=> ss <= "1010000";
				when x"1" 	=> ss <= "1111001";
				when x"2" 	=> ss <= "0100100";
				when x"3" 	=> ss <= "0110000";
				when x"4" 	=> ss <= "0011001";
				when x"5" 	=> ss <= "0010010";
				when x"6" 	=> ss <= "0000010";
				when x"7" 	=> ss <= "1111000";
				when x"8" 	=> ss <= "0000000";
				when x"9" 	=> ss <= "0010000";
				when x"a" 	=> ss <= "0001000";
				when x"b" 	=> ss <= "0000011";
				when x"c" 	=> ss <= "1000110";
				when x"d" 	=> ss <= "0100001";
				when x"e" 	=> ss <= "0000110";
				when others => ss <= "0001110";
			
			end case ;
		end if ;
	end process;
	

	sseg <= dp & ss;
	
end Behavioral;

