----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:06 07/22/2023 
-- Design Name: 
-- Module Name:    CHIA_ENA1HZ - Behavioral 
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

entity CHIA_ENA1HZ is
	port(
		CKHT: in std_logic;
		led: out std_logic);
end CHIA_ENA1HZ;

architecture Behavioral of CHIA_ENA1HZ is

begin

	IC: entity work.CHIA_ENA1HZ_MODULE
		port map(
				CKHT => CKHT,
				ena1hz => led);

end Behavioral;

