----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:49 07/23/2023 
-- Design Name: 
-- Module Name:    DEM_BINARY_8BITS_SS_UD_TD - Behavioral 
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

entity DEM_BINARY_8BITS_SS_UD_TD is
	port(
		CKHT: 	in 	std_logic;
		switch: in 	std_logic;
		button: in 	std_logic;
		leds: 	out std_logic_vector(8 downto 0));
end DEM_BINARY_8BITS_SS_UD_TD;

architecture Behavioral of DEM_BINARY_8BITS_SS_UD_TD is
	signal ena_syn: std_logic;
	signal ena_ud: 	std_logic;
	signal qd: 		std_logic_vector(7 downto 0);
begin
	
	IC1: entity work.CHIA_ENA1HZ_MODULE
		port map(
				CKHT 	=> CKHT,
				ena1hz 	=> ena_syn);

	IC2: entity work.DEM_8BITS_SS_UD_TD
		port map(
				ena_syn => ena_syn,
				CKHT 	=> CKHT,
				rst 	=> button,
				ena_ss 	=> switch,
				ena_ud 	=> ena_ud,
				q 		=> qd);

	IC3: entity work.AUTO_DAO_ENA_UD
		port map(
				CKHT	=> CKHT,
				rst		=> button,
				ena_ud 	=> ena_ud,
				q_ss	=> qd);

	leds(7 downto 0) 	<= qd;
	leds(8) 			<= ena_ud;
end Behavioral;

