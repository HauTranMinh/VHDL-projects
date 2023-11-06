----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:23:42 08/08/2023 
-- Design Name: 
-- Module Name:    HT_8SO_8L7D_8DP_8ENA - Behavioral 
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

entity HT_8SO_8L7D_8DP_8ENA is
	port(
		sw: 	in 	std_logic_vector(3 downto 0);
		btn: 	in 	std_logic_vector(7 downto 0);
		CKHT: 	in 	std_logic;
		sseg: 	out std_logic_vector(7 downto 0);
		anode: 	out std_logic_vector(7 downto 0));
end HT_8SO_8L7D_8DP_8ENA;

architecture Behavioral of HT_8SO_8L7D_8DP_8ENA is
	Signal ena1khz: 	std_logic;
	Signal ena_8led: 	std_logic_vector(3 downto 0);
	Signal dc_8led: 	std_logic_vector(7 downto 0);
begin

	dc_8led <= btn;
	ena_8led <= sw;
	
	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
			CKHT 	=> CKHT,
			CK1KHZ 	=> ena1khz);

	IC2: entity work.GM_HT_8LED
		port map(
			led70 => x"a",
			led71 => x"c",
			led72 => x"0",
			led73 => x"c",
			led74 => x"f",
			led75 => x"f",
			led76 => x"a",
			led77 => x"c",
			dc_8led 	=> dc_8led,
			ena_8led 	=> ena_8led,
			ena1khz 	=> ena1khz,
			CKHT 		=> CKHT,
			sseg 		=> sseg,
			anode 		=> anode);



end Behavioral;

