----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:34 07/22/2023 
-- Design Name: 
-- Module Name:    DEM_4BITS - Behavioral 
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
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_4BITS is
	port(
		CKHT: 		in std_logic;
		ena_syn: 	in std_logic;
		RST: 		in std_logic;
		q: 			out std_logic_vector(3 downto 0));
end DEM_4BITS;

architecture Behavioral of DEM_4BITS is
	constant n: integer := 50000000;
	signal q_r, q_n: std_logic_vector(3 downto 0);
begin
	
	process(RST, CKHT)
	begin
		if RST = '0' then
			q_r <= (others => '0');
		elsif falling_edge(CKHT) then
			q_r <= q_n;
		end if ;
	end process;

	q_n <= std_logic_vector(unsigned(q_r) + 1) when ena_syn = '1' else q_r;

	q <= q_r;

end Behavioral;

