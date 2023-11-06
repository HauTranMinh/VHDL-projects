----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:12:34 07/22/2023 
-- Design Name: 
-- Module Name:    DEM_BINARY_8BITS_SS_UD - Behavioral 
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

entity DEM_BINARY_8BITS_SS_UD is
	port(
		CKHT: in std_logic;
		swicth: in std_logic_vector(1 downto 0);
		button: in std_logic;
		leds: out std_logic_vector(7 downto 0));
end DEM_BINARY_8BITS_SS_UD;

architecture Behavioral of DEM_BINARY_8BITS_SS_UD is
	Signal ena_syn: std_logic;
begin
	IC1: entity work.CHIA_ENA1HZ_MODULE
		port map(
				CKHT => CKHT,
				ena1hz => ena_syn);

	IC2: entity work.DEM_8BITS_SS_UD
		port map(
				ena_syn => ena_syn,
				CKHT	=> CKHT,
				ena_ss	=> swicth(0),
				ena_ud	=> swicth(1),
				RST		=> button,
				q		=> leds);


end Behavioral;

