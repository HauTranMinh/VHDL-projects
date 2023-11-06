----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:01 08/07/2023 
-- Design Name: 
-- Module Name:    dem_3bits - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_3bits is
	port(
		ena1khz: 	in 	std_logic;
		CKHT: 		in 	std_logic;
		q: 			out std_logic_vector(2 downto 0));
end dem_3bits;

architecture Behavioral of dem_3bits is
	Signal q_r, q_n: std_logic_vector(2 downto 0);
begin
	
	process(CKHT)
	begin
		if (falling_edge(CKHT)) then
			q_r <= q_n;
		end if ;
	end process;
	
	q_n <=  std_logic_vector(Unsigned(q_r) + 1) when ena1khz = '1' else
		q_r;

	q <= q_r;
end Behavioral;

