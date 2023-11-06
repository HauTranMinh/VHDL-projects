------------------------------------------------------------------------------------------
-- File: Shift_res.vhd
-- Engineer: Hau Tran
------------------------------------------------------------------------------------------

-- library'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity BUTTON_LED is

	-- define numbers of button --
	generic (
		NUM_BUTTON: integer := 8);


	-- define IO pin --
	port(
		led_out: 			out 		std_logic_vector(7 downto 0); -- transitor per 7seg led --
		data_led:			out		std_logic_vector(7 downto 0); -- data that 7seg display -- 
		buzzer:				out		std_logic;
		button:				in 		std_logic_vector(7 downto 0);
		enable_data_led: 	in 		std_logic;							-- enable for 7seg to high -- 
		enable_buzzer:		in			std_logic;
		enable: 				in 		std_logic);

end BUTTON_LED;

architecture behavior of BUTTON_LED is

begin
	
	led_out 	<= button when enable = '0' else (others => '0');
	data_led <= button when enable_data_led = '0' else (others => '1');
	buzzer 	<= enable_buzzer;

end behavior;

