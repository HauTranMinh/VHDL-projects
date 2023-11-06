----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:38 08/03/2023 
-- Design Name: 
-- Module Name:    dem_4bits_btn - Behavioral 
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

entity dem_4bits_btn is
	port(
		CKHT: 	in 	std_logic;
		rst: 	in 	std_logic;
		btn: 	in 	std_logic;
		q: 		out std_logic_vector(3 downto 0));
end dem_4bits_btn;

architecture Behavioral of dem_4bits_btn is
	Signal xcd, xcdlh: std_logic;
begin	
	
	IC1: entity work.debounce_btn
		port map(
				CKHT 	=> CKHT,
				btn 	=> NOT btn,
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
				q 		=> q);


end Behavioral;

