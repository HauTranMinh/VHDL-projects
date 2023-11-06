----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:16 08/01/2023 
-- Design Name: 
-- Module Name:    debounce_button - Behavioral 
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

entity debounce_button is
	port(
		buttons: 	in 	std_logic_vector(1 downto 0);
		CKHT: 		in 	std_logic;
		led: 		out std_logic_vector(3 downto 0));
end debounce_button;


architecture Behavioral of debounce_button is
	signal xcd: 		std_logic;
	signal xcdlh: 		std_logic;
	signal button_1: 	std_logic;
	signal rst: 		std_logic;
begin
	rst 	 <= buttons(0);
	button_1 <= buttons(1);

	IC1: entity work.debounce_btn
		port map(
				CKHT 	=> CKHT,
				btn 	=> NOT button_1,
				db_tick => xcd);

	IC2: entity work.lam_hep_xung
		port map(
				d 	 => xcd,
				CKHT => CKHT,
				q 	 => xcdlh);

	IC3: entity work.DEM_4BITS
		port map(
				CKHT 	=> CKHT,
				ena_syn => xcdlh,
				RST 	=> rst,
				q 		=> led);

end Behavioral;

