----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:54 08/03/2023 
-- Design Name: 
-- Module Name:    JS_PST - Behavioral 
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

entity JS_PST is
	port(
		CKHT: 		in 	std_logic;
		rst: 		in 	std_logic;
		oe: 		in 	std_logic;
		ena_db: 	in 	std_logic;
		q: 			out std_logic_vector(7 downto 0));
end JS_PST;

architecture Behavioral of JS_PST is
	signal q_r, q_n: std_logic_vector(7 downto 0);
begin
	
	process(CKHT, rst)
	begin
		if (rst = '0') then q_r <= (others => '0');
		elsif (falling_edge(CKHT)) then q_r <= q_n;
		end if ;
	end process;

	q_n <= (others => '0') when oe = '0' else
			q_r(6 downto 0) & not q_r(7)  when ena_db = '1'
			else q_r;

	q <= q_r when oe = '1' else (others => '0');
end Behavioral;

