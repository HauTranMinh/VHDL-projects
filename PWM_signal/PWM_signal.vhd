----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:47 07/10/2023 
-- Design Name: 
-- Module Name:    PWM_signal - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_signal is
	generic(
			BIT_DEPTH : integer := 8; -- revolutoin --
			INPUT_CLK : integer := 50000000; -- 50Mhz default crystal on board --
			FREQ	  	 : integer := 50 ); -- output FRQ --

	port(
		pwm_out 	: out std_logic;
		duty_cycle	: in std_logic_vector(BIT_DEPTH - 1 downto 0);
		enable		: in std_logic;
		clk 		: in std_logic);
end PWM_signal;

architecture Behavioral of PWM_signal is

-- constants -- 
	constant max_freq_count : integer := INPUT_CLK / FREQ; -- 1M -- 
	constant pwm_step		: integer := max_freq_count / (2 ** BIT_DEPTH); -- 3905 steps --  

-- signal -- 
	signal pwm_value 			: std_logic := '0';
	signal freq_count 		: integer range 0 to max_freq_count 	:= 0;
	signal pwm_count			: integer range 0 to (2 ** BIT_DEPTH) 	:= 0;
	signal max_pwm_count		: integer range 0 to (2 ** BIT_DEPTH) 	:= 0; 
	signal pwm_step_count 	: integer range 0 to max_freq_count 	:= 0;
begin
	-- convert duty cycle to max_pwm_count -- 
	 max_pwm_count <= to_integer(Unsigned(duty_cycle));
	 pwm_out <= pwm_value;

	 -- process that runs signal out at the correct freq --

	 freq_counter: process(clk)
	 begin
	 	if rising_edge(clk) then
	 		if enable = '0' then
----------------------------------------------------------------------------------
	 			if 	(freq_count < max_freq_count) then
	 				freq_count <= freq_count + 1;
	 				if (pwm_count < max_pwm_count) then
	 					pwm_value <= '1';
	 					if (pwm_step_count < pwm_step) then
	 						pwm_step_count <= pwm_step_count + 1;
	 					else
	 						pwm_step_count <= 0;
	 						pwm_count <= pwm_count + 1;		
	 					end if; 
	 				else
	 					pwm_value <= '0';
	 				end if ;
	 			else
	 				freq_count <= 0;
	 				pwm_count <= 0;
	 			end if ;
-------------------------------------------------------------------------------------
	 		else 
	 			pwm_value <= '0';
	 			
	 		end if ;
	 		
	 	end if ;
	 end process freq_counter;
end Behavioral;

