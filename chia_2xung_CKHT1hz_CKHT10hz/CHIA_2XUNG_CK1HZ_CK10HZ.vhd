----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:32:38 07/22/2023 
-- Design Name: 
-- Module Name:    CHIA_2XUNG_CK1HZ_CK10HZ - Behavioral 
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

entity CHIA_2XUNG_CK1HZ_CK10HZ is
	port(
		clk: in std_logic;
		led: out std_logic_vector(1 downto 0));
end CHIA_2XUNG_CK1HZ_CK10HZ;

architecture Behavioral of CHIA_2XUNG_CK1HZ_CK10HZ is

begin
	IC: entity work.CHIA_CK1HZ_CK10HZ
		port map(
				CKHT 	=> clk,
				CK1HZ 	=> led(0),
				CK10HZ 	=> led(1));


end Behavioral;

