----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:12 07/23/2023 
-- Design Name: 
-- Module Name:    DEM_8BITS_SS_UD_TD - Behavioral 
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

entity DEM_8BITS_SS_UD_TD is
	port(
		ena_syn: 	in 	std_logic;
		CKHT: 		in 	std_logic;
		rst: 		in 	std_logic;
		ena_ss: 	in 	std_logic;
		ena_ud: 	in 	std_logic;
		q: 			out std_logic_vector(7 downto 0));
end DEM_8BITS_SS_UD_TD;

architecture Behavioral of DEM_8BITS_SS_UD_TD is
	-- Constant n: integer 50000000;
	Signal q_r, q_n: std_logic_vector(7 downto 0);
	Signal ena: std_logic;
begin
	
	process(rst, CKHT)
	begin
		if rst = '0' then
			q_r <= (others => '0');
		elsif falling_edge(CKHT) then
			q_r <= q_n;	
		end if ;
	end process;

	ena <= ena_syn and ena_ss;

	q_n <= 	std_logic_vector(Unsigned(q_r) + 1) when ena = '1' and ena_ud = '0' else 
				std_logic_vector(Unsigned(q_r) - 1) when ena = '1' and ena_ud = '1' else
			q_r;

	q <= not(q_r);

end Behavioral;

