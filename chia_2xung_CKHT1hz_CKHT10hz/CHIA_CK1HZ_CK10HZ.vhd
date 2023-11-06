----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:08 07/22/2023 
-- Design Name: 
-- Module Name:    CHIA_CK1HZ_CK10HZ - Behavioral 
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

entity CHIA_CK1HZ_CK10HZ is
	port(
		CKHT: 		in std_logic;
		CK1HZ:	 	out std_logic;
		CK10HZ: 	out	std_logic);
end CHIA_CK1HZ_CK10HZ;

architecture Behavioral of CHIA_CK1HZ_CK10HZ is
	constant n: integer := 50000000;
	signal d1hz_r, d1hz_n: 		integer range 0 to n := 1;
	signal d10hz_r, d10hz_n: 	integer range 0 to n/10 := 1;
begin
	
	process(CKHT)
	begin
		if falling_edge(CKHT) then d1hz_r <= d1hz_n;
									d10hz_r <= d10hz_n;
			
		end if ;
	end	process;

	d1hz_n 	<= 1 when d1hz_r 	= n/1 	else d1hz_r + 1;
	d10hz_n <= 1 when d10hz_r 	= n/10 	else d10hz_r + 1;

	CK1HZ 	<= '0' when d1hz_r 	> n/2 else '1';
	CK10HZ 	<= '0' when	d10hz_r > n/20 else '1';
		

end Behavioral;

 