----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:42 07/22/2023 
-- Design Name: 
-- Module Name:    CK1HZ - Behavioral 
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

entity CK1HZ is
	port(
		CKHT: in STD_LOGIC;
		CK1HZ: out STD_LOGIC);
end CK1HZ;

architecture Behavioral of CK1HZ is
	constant n: integer := 50000000;
	signal d1hz_r, d1hz_n: integer range 0 to n := 1; 

begin
	process(CKHT)
	begin
		if falling_edge(CKHT) then
			d1hz_r <= d1hz_n;
			
		end if ;
	end process;

	d1hz_n <= 1 when d1hz_r = n/1 else d1hz_r + 1;

	CK1HZ <= '0' when d1hz_r = n/2 else '1';
		
end Behavioral;

