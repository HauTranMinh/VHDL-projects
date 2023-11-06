----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:36:32 08/06/2023 
-- Design Name: 
-- Module Name:    giaima_24h - Behavioral 
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

entity giaima_24h is
	port(
		i: in 	std_logic_vector(1 downto 0);
		o: out 	std_logic_vector(3 downto 0));
end giaima_24h;

architecture Behavioral of giaima_24h is

begin
	o <= 	"1110" when i = "00" else
			"1101" when i = "01" else
			"1011" when i = "10" else
			"0111";

end Behavioral;

