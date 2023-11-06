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
		--CK1HZ:	 	out std_logic;
		CK1KHZ: 		out	std_logic);
end CHIA_CK1HZ_CK10HZ;

architecture Behavioral of CHIA_CK1HZ_CK10HZ is
	constant n: integer := 50000000;
	--signal d1hz_r, d1hz_n: 		integer range 0 to n/50 := 1;
	signal d1khz_r, d1khz_n: 	integer range 0 to n/1000 := 1;
begin
	
	process(CKHT)
	begin
		if falling_edge(CKHT) then --d1hz_r <= d1hz_n;
									d1khz_r <= d1khz_n;
			
		end if ;
	end	process;

	--d1hz_n 	<= 1 when d1hz_r 	= n/50 	else d1hz_r + 1;
	d1khz_n 	<= 1 when d1khz_r 	= n/1000 	else d1khz_r + 1;

	--CK1HZ 	<= '1' when d1hz_r 	= n/100 else '0';
	CK1KHZ 	<= '1' when	d1khz_r = n/2000 else '0';
		

end Behavioral;

 