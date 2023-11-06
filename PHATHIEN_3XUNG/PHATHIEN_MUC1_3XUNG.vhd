----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:26 07/24/2023 
-- Design Name: 
-- Module Name:    PHATHIEN_MUC1_3XUNG - Behavioral 
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

entity PHATHIEN_MUC1_3XUNG is
	port(
		CKHT: 	in 	std_logic;
		switch: in 	std_logic;
		button: in 	std_logic;
		leds: 	out std_logic_vector(3 downto 0));
end PHATHIEN_MUC1_3XUNG;

architecture Behavioral of PHATHIEN_MUC1_3XUNG is
	type FSM is (zero, one, two, three);
	signal tt_r, tt_n, stg: FSM;
	signal ena_db, q, rst, 	d: std_logic;
	signal tt: std_logic_vector(1 downto 0);
begin

	d 	<= switch;
	rst <= button;

	IC1: entity work.CHIA_ENA1HZ_CK1HZ
		port map(
				CKHT 	=> CKHT,
				ena1hz 	=> ena_db,
				ck1hz 	=> leds(3));

	process(CKHT, rst)
		begin
			if rst = '0' then
				tt_r <= zero;

			elsif falling_edge(CKHT) then
				tt_r <= tt_n;
			end if ;
		end process;

	process(tt_r, d)
	begin
		case( tt_r ) is
		
			when zero => q <= '0'; tt <= "00";
				if d = '1' then stg <= one;
				else 			stg <= zero;
				end if ;
				
			when one => q <= '0'; tt <= "01";
				if d = '1' then stg <= two;
				else 			stg <= zero;
				end if ;

			when two => q <= '0'; tt <= "10";
				if d = '1' then stg <= three;
				else 			stg <= zero;
				end if ;
				
			when others => q <= '1'; tt <= "11";
				if d = '1' then stg <= three;
				else 			stg <= zero;
				end if ;
		
		end case ;
	end process;

	tt_n <= stg when ena_db = '1' else tt_r;

	leds(2 downto 1) <= tt;
	leds(0) <= q;
		

end Behavioral;

