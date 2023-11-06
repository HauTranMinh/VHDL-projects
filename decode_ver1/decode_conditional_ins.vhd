----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:33:02 07/18/2023 
-- Design Name: 
-- Module Name:    decode_conditional_ins - Behavioral 
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

entity decode_conditional_ins is
	port(
		i: in std_logic_vector(1 downto 0);
		o: out std_logic_vector(3 downto 0));
end decode_conditional_ins;

architecture Behavioral of decode_conditional_ins is

begin
	o <= 	"0001" when i = "00" else
			"0010" when i = "01" else
			"0100" when i = "10" else
			"1000";

end Behavioral;

