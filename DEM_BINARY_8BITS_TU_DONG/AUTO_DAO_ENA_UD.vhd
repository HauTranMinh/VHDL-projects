----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:22 07/23/2023 
-- Design Name: 
-- Module Name:    AUTO_DAO_ENA_UD - Behavioral 
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

entity AUTO_DAO_ENA_UD is
	port(
		CKHT: 	in std_logic;
		rst: 	in std_logic;
		ena_ud: out std_logic;
		q_ss: in std_logic_vector(7 downto 0));
end AUTO_DAO_ENA_UD;

architecture Behavioral of AUTO_DAO_ENA_UD is
	signal ud_r, ud_n: std_logic;
begin

	process(CKHT, rst)
	begin
		if rst = '0' then 
			ud_r <= '0';
		elsif falling_edge(CKHT) then
			ud_r <= ud_n;
		end if ;
	end process;

	ud_n <= '1' when q_ss = x"ff" else
				'0' when q_ss = x"00" else
			ud_r;

	ena_ud <= ud_r;

end Behavioral;

