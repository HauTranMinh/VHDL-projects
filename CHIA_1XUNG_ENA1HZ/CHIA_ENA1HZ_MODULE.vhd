----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:55:31 07/22/2023 
-- Design Name: 
-- Module Name:    CHIA_ENA1HZ_MODULE - Behavioral 
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

entity CHIA_ENA1HZ_MODULE is
	port(
		CKHT: 	in std_logic;
		ena1hz: out std_logic);
end CHIA_ENA1HZ_MODULE;

architecture Behavioral of CHIA_ENA1HZ_MODULE is
	constant n: integer := 50000000;
	signal d1hz_r, d1hz_n: integer range 0 to n := 1;
begin
	process(CKHT)
	begin
		if falling_edge(ckht) then
			d1hz_r <= d1hz_n;
		end if ;
	end process;

	d1hz_n <= 1 when d1hz_r = n/1 else d1hz_r + 1;

	ena1hz <= '1' when d1hz_r = n/2 else '0';
		  


end Behavioral;

