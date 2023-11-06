----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:52 08/04/2023 
-- Design Name: 
-- Module Name:    DAHOP_2KENH - Behavioral 
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

entity DAHOP_2KENH is
	port(
		i0, i1: 	in 	std_logic_vector(3 downto 0);
		s: 			in 	std_logic;
		o: 			out std_logic_vector(3 downto 0));
end DAHOP_2KENH;

architecture Behavioral of DAHOP_2KENH is
	
begin
	
	o <= i0 when s = '0' else i1;
		

end Behavioral;

