----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:33:37 08/04/2023 
-- Design Name: 
-- Module Name:    CHIA_10ENA - Behavioral 
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

entity CHIA_10ENA is
	port(
		CKHT: 		in 	std_logic;
		ena_1hz: 	out std_logic;
		ena_1khz: 	out std_logic);
end CHIA_10ENA;

architecture Behavioral of CHIA_10ENA is
	constant n: integer := 50000000;
	Signal d1hz_r, d1hz_n: integer range 0 to n/1 := 0;
	Signal d1khz_r, d1khz_n: integer range 0 to n/1000 := 0;
begin
	
	process(CKHT)
	begin
		if (falling_edge(CKHT)) then
			d1hz_r 	<= d1hz_n;
			d1khz_r <= d1khz_n;
		end if ;
	end	process;

	d1khz_n <= 1 when d1khz_r = n/1000 else d1khz_r + 1;
	d1hz_n <= 1 when d1hz_r = n/1 else d1hz_r + 1;
		

	ena_1hz 	<= '0' when d1hz_r > n/2 else '1';
	ena_1khz 	<= '0' when d1khz_r > n/2000 else '1';

end Behavioral;

