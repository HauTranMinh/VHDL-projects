----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:45:09 07/08/2023 
-- Design Name: 
-- Module Name:    blinking_led - Behavioral 
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
use IEEE.math_real.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blinking_led is
	generic(
			NUM_LEDS : integer := 8; 
			CLOCK:     integer := 100000000; -- 50Mhz default -- 
			BLINK_RATE:integer := 2);
	port(
			led_out : 		out std_logic_vector(NUM_LEDS - 1 downto 0);
			clk:			in std_logic;
			reset:			in std_logic); --active low -- 
end blinking_led;

architecture Behavioral of blinking_led is
	-- Calculate count value to achieve 'BLINK_RATE' from generic -- 
	constant MAX_VAL : 		integer := CLOCK / BLINK_RATE;
	-- Calculate number of bits required to count to 'MAX_VAL' -- 
	constant BIT_DEPTH : 	integer := integer(ceil(log2(real(MAX_VAL)))); 
	
	-- Register to hold the current count value -- 
	signal	count_reg : Unsigned(BIT_DEPTH - 1 downto 0) := (others => '0');
	-- Register to hold the value of output LEDs -- 
	signal led_reg	   	: std_logic_vector(NUM_LEDS - 1 downto 0) := "00000000";
	------------------------------------------------------------------------------------	
begin
	led_out <= led_reg;

	count_proc: process(clk)
		begin
			if rising_edge(clk) then
					if ((reset = '0') or (count_reg = MAX_VAL)) then
					 	count_reg <= (others => '0');
					 else
					 	count_reg <= count_reg + 1;	
					 end if ; 
			end if ;	
	end process;

	-- Process that will toggle the LED output every time the counter
	-- reaches the calculated 'MAX_VAL'

	output_proc: process(clk)
		begin
			if rising_edge(clk) then
				if(count_reg = MAX_VAL) then
					led_reg <= NOT led_reg;
				end if;
			end if ;
	end process;

end Behavioral;

