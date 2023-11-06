----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:43 07/21/2023 
-- Design Name: 
-- Module Name:    dem_1so - Behavioral 
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
--

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_1so is
	port(
		CKHT: 	in 	std_logic;
		rst: 		in 	std_logic;
		ena_db: in 	std_logic;
		ena_ss: in 	std_logic;
		donvi: 	out std_logic_vector(3 downto 0));
end dem_1so;

architecture Behavioral of dem_1so is
	signal donvi_r: 	std_logic_vector(3 downto 0);
	signal donvi_n: 	std_logic_vector(3 downto 0);
	signal ena:		std_logic;
begin
	
	process(CKHT, rst)
	begin
		if 		rst = '0' 			then donvi_r <= x"0";
		elsif 	falling_edge(CKHT) 	then donvi_r <= donvi_n;		
		end if ;
	end process;

	ena <= ena_ss and ena_db;

	donvi_n <= 	x"0" when donvi_r = x"9" and ena = '1' else
				std_logic_vector(unsigned(donvi_r) + 1) when ena = '1' else
				donvi_r;

	donvi <= donvi_r;


end Behavioral;

