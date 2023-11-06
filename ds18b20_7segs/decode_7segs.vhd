----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:43 07/18/2023 
-- Design Name: 
-- Module Name:    decode_7segs - Behavioral 
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

entity decode_7segs is
	port(
		sw: 		in std_logic_vector(3 downto 0);
		ssegs_data: out std_logic_vector(7 downto 0));
end decode_7segs;

architecture Behavioral of decode_7segs is

begin
	process(sw)
		begin
			case( sw ) is			
				when x"0" 	=> ssegs_data <= x"c0";
				when x"1" 	=> ssegs_data <= x"f9";
				when x"2" 	=> ssegs_data <= x"a4";
				when x"3" 	=> ssegs_data <= x"b0";
				when x"4" 	=> ssegs_data <= x"99";
				when x"5" 	=> ssegs_data <= x"92";
				when x"6" 	=> ssegs_data <= x"82";
				when x"7" 	=> ssegs_data <= x"f8";
				when x"8" 	=> ssegs_data <= x"80";
				when x"9" 	=> ssegs_data <= x"90";
				when x"a" 	=> ssegs_data <= x"88";
				when x"b" 	=> ssegs_data <= x"83";
				when x"c" 	=> ssegs_data <= x"c6";
				when x"d" 	=> ssegs_data <= x"a1";
				when x"e" 	=> ssegs_data <= x"86";
				when others => ssegs_data <= x"8e";
			end case ;
		end process;



end Behavioral;

