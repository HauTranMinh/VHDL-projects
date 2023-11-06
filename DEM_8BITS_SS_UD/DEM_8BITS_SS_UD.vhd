----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:39 07/22/2023 
-- Design Name: 
-- Module Name:    DEM_8BITS_SS_UD - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_8BITS_SS_UD is
	Port(
		CKHT: 		in 		std_logic;
		ena_syn: 	in 		std_logic;
		ena_ss: 		in 		std_logic;
		ena_ud: 		in 		std_logic;
		RST:			in 		std_logic;
		q: 			out 	std_logic_vector(7 downto 0));
end DEM_8BITS_SS_UD;

architecture Behavioral of DEM_8BITS_SS_UD is
	signal q_r, q_n: std_logic_vector(7 downto 0);
	signal ena: 		std_logic;
begin
	process(RST, CKHT)
	begin
		if RST = '0' then
			q_r <= (others => '0');
		elsif falling_edge(CKHT) then
			q_r <= q_n;
		end if ;
	end process;

	ena <= ena_ss and ena_syn;

	q_n <= std_logic_vector(Unsigned(q_r) + 1) when ena = '1' and ena_ud = '0' else
			std_logic_vector(Unsigned(q_r) - 1) when ena = '1' and ena_ud = '1' else
				q_r;


	q <= not(q_r);


end Behavioral;

