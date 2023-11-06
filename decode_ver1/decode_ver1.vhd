----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:43 07/17/2023 
-- Design Name: 
-- Module Name:    decode_ver1 - Behavioral 
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

entity decode_ver1 is
    Port ( switch : in  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end decode_ver1;

architecture Behavioral of decode_ver1 is
	
	

begin
	
	decode_select_ins: entity work.decode_select_ins
		port map(
					i => switch(1 downto 0),
					o => led(3 downto 0));
					
	decode_conditional_ins: entity work.decode_conditional_ins
		port map(
					i => switch(3 downto 2),
					o => led(7 downto 4));

end Behavioral;

