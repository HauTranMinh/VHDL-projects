----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:16:31 08/01/2023 
-- Design Name: 
-- Module Name:    debounce_btn - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce_btn is
	port(
		CKHT: 		in 	std_logic;
		btn: 		in 	std_logic;
		db_tick: 	out std_logic);
end debounce_btn;

architecture Behavioral of debounce_btn is
	constant n: integer := 20;
	type db_state is (zero, wait0, one, wait1);
	signal db_r, db_n: db_state := zero;
	signal dl_r, dl_n: Unsigned(n-1 downto 0);

begin
----------------------------------------------------
	process (CKHT)
	begin
		if (falling_edge(CKHT)) then
			db_r <= db_n;
			dl_r <= dl_n;
		end if ;
	end	process;
----------------------------------------------------

	process(dl_r, db_r, btn)
	begin
		dl_n <= dl_r;
		db_n <= db_r; 

		case( db_r ) is
		
			when zero => 
				db_tick <= '0';
				if btn = '1' then
					db_n <= wait1;
					dl_n <= (others => '1');	
				end if ;

			when wait1 =>
				db_tick <= '0';
				dl_n <= dl_r - 1;
				if dl_r = 0 then
					if (btn = '1') then
						db_n <= one;
					else
						db_n <= zero;
					end if ;
				end if ;

			when one => db_tick <= '1';	
				if (btn = '0') then
					dl_n <= (others => '1');
					db_n <= wait0; 
				end if ;

			when wait0 => db_tick <= '1';
				dl_n <= dl_r - 1;
				if (dl_r = 0) then
					if (btn = '0') then
						db_n <= zero;
					else 	
						db_n <= one;
					end if ;
				end if ;
		end case ;
	end	process;

----------------------------------------------------


end Behavioral;

