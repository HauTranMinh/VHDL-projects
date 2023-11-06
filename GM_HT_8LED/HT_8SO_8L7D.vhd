----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:16 08/07/2023 
-- Design Name: 
-- Module Name:    HT_8SO_8L7D - Behavioral 
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

entity HT_8SO_8L7D is
	port(
		CKHT: 	in 	std_logic;
		sseg: 	out std_logic_vector(6 downto 0);
		anode: 	out std_logic_vector(7 downto 0));
end HT_8SO_8L7D;

architecture Behavioral of HT_8SO_8L7D is
	Signal ena1khz: std_logic;

begin
	
	IC1: entity work.CHIA_CK1HZ_CK10HZ
		port map(
			CKHT => CKHT,
			CK1KHZ => ena1khz);

	IC2: entity work.GM_HT_8LED
		port map(
			led70 => x"1",
			led71 => x"2",
			led72 => x"3",
			led73 => x"4",
			led74 => x"5",
			led75 => x"6",
			led76 => x"7",
			led77 => x"8",
			ena1khz => ena1khz,
			sseg => sseg,
			anode => anode,
			CKHT => CKHT);

end Behavioral;

