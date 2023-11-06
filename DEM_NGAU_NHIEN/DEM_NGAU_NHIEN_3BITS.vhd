----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:23:37 07/24/2023 
-- Design Name: 
-- Module Name:    DEM_NGAU_NHIEN_3BITS - Behavioral 
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
use IEEE.math_real.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEM_NGAU_NHIEN_3BITS is
	port(
		CKHT: 	in 	std_logic;
		rst: 	in 	std_logic;
		led: 	out std_logic_vector(2 downto 0));
end DEM_NGAU_NHIEN_3BITS;

architecture Behavioral of DEM_NGAU_NHIEN_3BITS is
	-- type FSM is (A, B, C, D, E, F, G, H);
	signal tt_next, tt_reg: std_logic_vector(2 downto 0);
begin
	
	process(CKHT, rst)
	begin
		if rst = '0' then
			tt_reg <= "000";
		elsif falling_edge(CKHT) then
			tt_reg <= tt_next;
		end if ;
	end	process;

	tt_next <= std_logic_vector(Unsigned(tt_reg) + 1);

	process(tt_reg)
	begin
		case( tt_reg ) is
			when "000" 	=> led <= "000";
			when "001" 	=> led <= "011";
			when "010" 	=> led <= "100";
			when "011" 	=> led <= "001";
			when "100" 	=> led <= "010";
			when "101" 	=> led <= "110";
			when "110" 	=> led <= "101";
			when others => led <= "111";		
		end case ;
	end process;

end Behavioral;

