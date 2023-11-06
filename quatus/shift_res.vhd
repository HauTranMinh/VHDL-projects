------------------------------------------------------------------------------------------
-- File: Shift_res.vhd
-- Engineer: Hau Tran
------------------------------------------------------------------------------------------

-- library'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- entity declaration
entity Shift_res is

port(
		A:			out std_logic;
		B:			out std_logic;
		C:			out std_logic;
		D:			out std_logic;
		data_in:	in 	std_logic;
		reset:	in 	std_logic;
		clk: 		in 	std_logic);

End	Shift_res;

-- Architecture --

Architecture behavior of Shift_res is

-- define the signals --

signal A_reg, B_reg: std_logic := '0';
signal C_reg, D_reg: std_logic := '0';

-- begin architecture -- 
begin
	-- signals assignment
	A <= A_reg;
	B <= B_reg;
	C <= C_reg;
	D <= D_reg;
	
	-- create process --

	reg_process: process(clk)
		begin	
			if(rising_edge(clk)) then
				if (reset = '1') then
					-- output low if reset is high --
					A_reg <= '0';
					B_reg <= '0';
					C_reg <= '0';
					D_reg <= '0'; 
				else
					-- outputs have value if reset is low -- 
					A_reg <= data_in;
					B_reg <= A_reg;
					C_reg <= B_reg;
					D_reg <= C_reg; 		
				end if ;
			end if;

			-- do nothing on the falling edge -- 
		end process reg_process;

end behavior;
