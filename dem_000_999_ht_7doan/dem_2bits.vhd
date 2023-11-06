----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:31 08/06/2023 
-- Design Name: 
-- Module Name:    dem_2bits - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_2bits is
	port(
		CKHT: 		in std_logic;
		ena1khz: 	in std_logic;
		q: 			out std_logic_vector(1 downto 0));
end dem_2bits;

architecture Behavioral of dem_2bits is
	Signal q_r, q_n: std_logic_vector(1 downto 0);
begin
	process(CKHT)
	begin
		if (falling_edge(CKHT)) then
			q_r <= q_n;
		end if ;
	end process;

	q_n <= std_logic_vector(Unsigned(q_r) + 1) when ena1khz = '1' else
		q_r;

	q <= q_r;

end Behavioral;

