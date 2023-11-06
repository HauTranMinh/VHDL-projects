----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:56 07/18/2023 
-- Design Name: 
-- Module Name:    sseg_ca - Behavioral 
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

entity sseg_ca is
	port(
		switch: 			in 	std_logic_vector(3 downto 0);
		anode: 			out 	std_logic_vector(7 downto 0);
		ssegs_data: 	out 	std_logic_vector(7 downto 0));

end sseg_ca;

architecture Behavioral of sseg_ca is

begin
	anode <= x"7f";

	IC: entity work.decode_7segs
		port map(
				sw 			=> switch,
				ssegs_data 	=> ssegs_data);


	
end Behavioral;

