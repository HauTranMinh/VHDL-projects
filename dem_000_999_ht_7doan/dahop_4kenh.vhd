----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:36:12 08/06/2023 
-- Design Name: 
-- Module Name:    dahop_4kenh - Behavioral 
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

entity dahop_4kenh is
	port(
		i0: in std_logic_vector(3 downto 0);
		i1: in std_logic_vector(3 downto 0);
		i2: in std_logic_vector(3 downto 0);
		i3: in std_logic_vector(3 downto 0);
		s: 	in std_logic_vector(1 downto 0);
		o: out std_logic_vector(3 downto 0));
end dahop_4kenh;

architecture Behavioral of dahop_4kenh is
	
begin
	o <= 	i3 when s = "00" else
			i2 when s = "01" else
			i1 when s = "10" else
			i0;
end Behavioral;

