----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:24:08 08/01/2023 
-- Design Name: 
-- Module Name:    lam_hep_xung - Behavioral 
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

entity lam_hep_xung is
	port(
		d: 		in 	std_logic;
		CKHT: 	in 	std_logic;
		q: 		out std_logic);
end lam_hep_xung;

architecture Behavioral of lam_hep_xung is
	Signal QFF: std_logic;

begin
	process(CKHT)
	begin
		if falling_edge(CKHT) then
			QFF <= d;
		end if ;
	end	process;

	q <= (NOT QFF) and d;
end Behavioral;

