----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:28 07/12/2023 
-- Design Name: 
-- Module Name:    led_brightness - Behavioral 
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

entity led_brightness is
	generic(
			INPUT_CLK 	: integer := 50000000;
			-- NUM_RGB_LEDS : integer := 4;
			NUM_LEDS 	: integer := 8;
			NUM_BUTTONS	: integer := 4
			);
	Port(
			led_out 		: out std_logic_vector(NUM_LEDS - 1 downto 0);
			buttons			: in std_logic_vector(NUM_BUTTONS - 1 downto 0);
			clk 			: in std_logic;
			LED_enable 		: in std_logic);

end led_brightness;

architecture Behavioral of led_brightness is

------------------------- Components--------------------------------------------
---------------- Pulse Width Modulation Design--------------------

Component PWM
	generic(
			BIT_DEPTH 	: integer := 8;
			INPUT_CLK	: integer := 50000000;
			FREQ 		: integer := 50);
	port(
			pwm_out 		: out std_logic;
			duty_cycle 		: in std_logic_vector(BIT_DEPTH - 1 downto 0);
			clk 			: in std_logic;
			enable 		: in std_logic);
end Component PWM;

------------------component counter-------------------------

Component COUNTER
	generic(
			MAX_VAL 	: integer := 2**30;
			SYNCH_reset : boolean := true);
	port(
			max_count 	: out std_logic;
			clk 		: in std_logic;
			Reset 		: in std_logic);
end Component COUNTER;

----------------------------Constants-----------------------
-- 85 is from taking 255, the max PWM value, and dividing by 3 seconds
Constant LED_MAX_COUNT 	: integer := INPUT_CLK / 85;

Constant SYN_RESET 		: boolean := true; -- active low --
 
Constant LED_MAX_DUTY 	: integer := 255;

-----------------------------SIGNALS-----------------------
signal led_max_cnt : std_logic := '0';
signal led_pwm_reg : std_logic := '0';


signal led_counter_rst 	: std_logic := '0';
signal led_duty_cycle 	: Unsigned(7 downto 0) := (others => '0');



begin
------------------------Assign Outputs---------------------

	led_out <= (others => led_pwm_reg);

---------------Invert enable signal for counter	-----------

	led_counter_rst <= NOT LED_enable;

-------------------LEDS COUNTER----------------------------

	LED_COUNTER: COUNTER
		generic map(LED_MAX_COUNT, SYN_RESET)
		port map(max_count => led_max_cnt, clk => clk, Reset => led_counter_rst);

-----------LED PWM Signal Generator (8 bit, 50Hz)----------

	LED_PWM: PWM
		generic map(8, INPUT_CLK, 50)
		port map(led_pwm_reg, std_logic_vector(led_duty_cycle), clk, LED_enable);

------------------LED PWM Count update Process-------------

	led_count_proc: Process(clk, buttons)
		begin
		----------- 1st button -----------------------
			if (rising_edge(clk) and buttons = "0111") then
				if (led_duty_cycle = LED_MAX_DUTY) then
					led_duty_cycle <= (others => '0');
				elsif (led_max_cnt = '1') then
					led_duty_cycle <= led_duty_cycle + 1;
				end if ;
		----------- 2nd button -----------------------
			elsif (rising_edge(clk) and buttons = "1011") then
				if (led_duty_cycle = LED_MAX_DUTY) then
					led_duty_cycle <= (others => '0');
				elsif (led_max_cnt = '1') then
					led_duty_cycle <= led_duty_cycle;
				end if ;
		------------------3rd button -----------------------
			elsif (rising_edge(clk) and buttons = "1101") then
				if (led_duty_cycle = LED_MAX_DUTY) then
					led_duty_cycle <= (others => '0');
				elsif (led_max_cnt = '1') then
					led_duty_cycle <= led_duty_cycle + 1;
				end if ;
		------------------- 4rd button ---------------------
			else
				if (led_duty_cycle = LED_MAX_DUTY) then
					led_duty_cycle <= (others => '0');
				elsif (led_max_cnt = '1') then
					led_duty_cycle <= led_duty_cycle + (1);
				end if ;
			end if ;
		end Process led_count_proc;

end Behavioral;

