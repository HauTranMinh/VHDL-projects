----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:09 08/05/2023 
-- Design Name: 
-- Module Name:    dem_1bit - Behavioral 
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

entity dem_1bit is
	port(
		CKHT: 		in 	std_logic;
		ena1khz: 	in 	std_logic;
		q: 			out std_logic);
end dem_1bit;

architecture Behavioral of dem_1bit is
	Signal q_r, q_n: std_logic;
begin

	process(CKHT)
	begin	
		if (falling_edge(CKHT)) then
			q_r <= q_n;
		end if ;
	end	process;

	q_n <= not q_r when ena1khz = '1' else q_r;

	q <= q_r;


end Behavioral;

