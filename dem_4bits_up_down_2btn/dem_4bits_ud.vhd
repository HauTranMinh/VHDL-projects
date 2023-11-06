----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:55:13 08/03/2023 
-- Design Name: 
-- Module Name:    dem_4bits_ud - Behavioral 
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

entity dem_4bits_ud is
	port(
		CKHT: 		in 	std_logic;
		ena_up: 	in 	std_logic;
		ena_down: 	in 	std_logic;
		rst: 		in 	std_logic;
		q: 			out	std_logic_vector(3 downto 0));
end dem_4bits_ud;

architecture Behavioral of dem_4bits_ud is
	signal q_r, q_n: std_logic_vector(3 downto 0);
begin
	process(CKHT, rst)
	begin
		if (rst = '0') then q_r <= (others => '1');
		elsif (falling_edge(CKHT)) then q_r <= q_n;
		end if ;
	end process;

	q_n <= 	std_logic_vector(Unsigned(q_r) + 1) when ena_up 	= '1' else
				std_logic_vector(Unsigned(q_r) - 1) when ena_down 	= '1' else
			q_r;

	q <= q_r;
end Behavioral;

