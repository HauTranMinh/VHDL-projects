----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:25:38 07/12/2023 
-- Design Name: 
-- Module Name:    LED_BLINKING - Behavioral 
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

entity LED_BLINKING is
	generic(
			NUM_LED 	: integer := 8; -- 8 leds on board -- 
			CLK_RATE	: integer := 50000000; -- 50Mhz -- 
			BLINK_RATE	: integer := 2); -- output 2 hz -- 

	port(
			led_out : out std_logic_vector(NUM_LED  - 1 downto 0);
			reset	: in std_logic;
			clk 	: in std_logic);
end LED_BLINKING;


architecture Behavioral of LED_BLINKING is

	-- Calculate count value to achieve 'BLINK_RATE' from generic --
	constant MAX_VAL : integer := CLK_RATE / BLINK_RATE;

	-- Calculate number of bits required to count to 'MAX_VAL' --
	constant BIT_DEPTH : integer := integer(ceil(log2(real(MAX_VAL))));

	-- Register to hold the current count value -- 
	signal count_reg : unsigned(BIT_DEPTH - 1 downto 0) :=  (others => '0');

	-- Register to hold the value of output LEDs -- 
	signal led_reg : std_logic_vector(NUM_LED - 1 downto 0) := (others => '0');

begin
	-- Assign output LED values -- 
	led_out <= led_reg;

	-- Process that increments the counter every rising clock edge
	count_proc : process(clk)
		begin
			if (rising_edge(clk)) then
				if ((reset = '0') or (count_reg = MAX_VAL)) then
					count_reg <= (others => '0');

				else
					count_reg <= count_reg + 1;
				end if ;
			end if ;

		end process count_proc;

	-- Process that will toggle the LED output every time the counter
		-- reaches the calculated 'MAX_VAL'
	output_proc: process(clk)
		begin
			if (count_reg = MAX_VAL) then
				led_reg <= NOT led_reg;
			end if ;
		end process output_proc;

end Behavioral;

