----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:26:30 08/08/2023 
-- Design Name: 
-- Module Name:    dahop_8kenh - Behavioral 
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

entity dahop_8kenh is
	port(
		s: 		in std_logic_vector(2 downto 0);
		i0: 	in std_logic_vector(3 downto 0);
		i1: 	in std_logic_vector(3 downto 0);
		i2: 	in std_logic_vector(3 downto 0);
		i3: 	in std_logic_vector(3 downto 0);
		i4: 	in std_logic_vector(3 downto 0);
		i5: 	in std_logic_vector(3 downto 0);
		i6: 	in std_logic_vector(3 downto 0);
		i7: 	in std_logic_vector(3 downto 0);
		
		dc8: 	in std_logic_vector(7 downto 0);
		dc1: 	out std_logic;
		ena8: 	in std_logic_vector(7 downto 0);
		ena2: 	out std_logic;

		o: 		out std_logic_vector(3 downto 0));
end dahop_8kenh;

architecture Behavioral of dahop_8kenh is
begin
	process(s, i0, i1, i2, i3, i4, i5, i6, i7, dc8, ena8)
	begin
		case( s ) is
		
			when "000" => o 	<= i0;
						dc1 	<= dc8(0);
						ena2 	<= ena8(0);
			when "001" => o 	<= i1;
						dc1 	<= dc8(1);
						ena2 	<= ena8(1);
			when "010" => o 	<= i2;
						dc1 	<= dc8(2);
						ena2 	<= ena8(2);
			when "011" => o 	<= i3;
						dc1 	<= dc8(3);
						ena2 	<= ena8(3);
			when "100" => o 	<= i4;
						dc1 	<= dc8(4);
						ena2 	<= ena8(4);	
			when "101" => o 	<= i5;
						dc1 	<= dc8(5);
						ena2 	<= ena8(5);
			when "110" => o 	<= i6;
						dc1 	<= dc8(6);
						ena2 	<= ena8(6);			
			when others => o 	<= i7;
						dc1 	<= dc8(7);
						ena2	<= ena8(7);
		
		end case ;
	end process;


end Behavioral;

