----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:29 08/03/2023 
-- Design Name: 
-- Module Name:    dem_4bits_up_down_2btns_module - Behavioral 
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

entity dem_4bits_up_down_2btns_module is
	port(
		CKHT: 			in 	std_logic;
		rst: 			in 	std_logic;
		btn_up: 		in 	std_logic;
		btn_down: 		in 	std_logic;
		q: 				out std_logic_vector(3 downto 0));
end dem_4bits_up_down_2btns_module;

architecture Behavioral of dem_4bits_up_down_2btns_module is
	Signal xcdlh_up, xcdlh_down: std_logic;
begin

	U1: entity work.cd_lam_hep_btn
		port map(
				CKHT => CKHT,
				btn => btn_up,
				xcdlh => xcdlh_up);

	U2: entity work.cd_lam_hep_btn
		port map(
				CKHT => CKHT,
				btn => btn_down,
				xcdlh => xcdlh_down);

	u3: entity work.dem_4bits_ud
		port map(
				CKHT 		=> CKHT,
				ena_up 		=> xcdlh_up,
				ena_down 	=> xcdlh_down,
				rst 		=> rst,
				q 			=> q);

end Behavioral;

