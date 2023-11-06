----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:15:45 07/22/2023 
-- Design Name: 
-- Module Name:    DEM_BINARY_4BITS - Behavioral 
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

entity DEM_BINARY_4BITS is
	port(
		CKHT: 	in 	std_logic;
		led: 	out std_logic_vector(3 downto 0);
		button: in 	std_logic);
end DEM_BINARY_4BITS;

architecture Behavioral of DEM_BINARY_4BITS is
	Signal ena_syn: std_logic;
begin
	
	IC1: entity work.CHIA_ENA1HZ_MODULE
		port map(
				CKHT => CKHT,
				ena1hz => ena_syn);

	IC2: entity work.DEM_4BITS
		port map(
				ena_syn => ena_syn,
				CKHT 	=> CKHT,
				RST 	=> button,
				q		=> led);
	

end Behavioral;

