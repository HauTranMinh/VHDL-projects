library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity test_shift_res is
end;

architecture test of test_shift_res is

	component shift_res 

		port(
				A:			out std_logic;
				B:			out std_logic;
				C:			out std_logic;
				D:			out std_logic;
				data_in:	in 	std_logic;	
				reset:	in 	std_logic;
				clk: 		in 	std_logic); 

	end	component; 

	signal data_in: 		std_logic := '0';
	signal reset: 			std_logic := '0';
	signal clk: 			std_logic := '0'; -- inital value is no matter -- 
	signal A, B, C, D:  	std_logic;

	begin
		-- describe how to test your design -- 
		dev_to_test: shift_res
			port map(A, B, C, D, data_in, reset, clk);

		clk_simulus: process
			begin
				wait for 10 ns;
				clk <= not clk;
		end process clk_simulus;

		data_simulus: process
		begin
			wait for 40 ns;
			data_in <= not data_in;
			wait for 150 ns;
		end	process data_simulus;
		
end test;


