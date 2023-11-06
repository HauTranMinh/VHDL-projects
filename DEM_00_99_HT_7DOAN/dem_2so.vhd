----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:34 08/04/2023 
-- Design Name: 
-- Module Name:    dem_2so - Behavioral 
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

entity dem_2so is
	port(
		CKHT: 		in 	std_logic;
		ena_db: 	in 	std_logic;
		ena_ss: 	in 	std_logic;
		rst: 		in 	std_logic;
		chuc: 		out	std_logic_vector(3 downto 0);
		donvi: 		out std_logic_vector(3 downto 0));
end dem_2so;

architecture Behavioral of dem_2so is
	Signal donvi_r, donvi_n: 	std_logic_vector(3 downto 0);
	Signal chuc_r, chuc_n: 		std_logic_vector(3 downto 0);
	Signal ena: 				std_logic;
begin
----------------------------------registor---------------------------------------------
	process(CKHT, rst)
	begin
		if (rst = '0') then
			donvi_r <= "0001";
			chuc_r 	<= "1010";
		elsif (falling_edge(CKHT)) then chuc_r 	<= chuc_n;
										donvi_r	<= donvi_n;	
		end if ;
	end process;
------------------------------next state logic---------------------------------------------
	ena <= ena_ss and ena_db;
	process(chuc_r, donvi_r, ena)
	begin
		chuc_n 	<= chuc_r;
		donvi_n <= donvi_r;
		if (ena = '1') then 
			if (chuc_r = x"9" and donvi_r = x"9") then
				donvi_n <= x"0";
				chuc_n 	<= x"0";
			elsif (donvi_r = x"9" and chuc_r /= x"9") then
				donvi_n <= x"0";
				chuc_n <= std_logic_vector(Unsigned(chuc_r) + 1);
			else
				donvi_n <= std_logic_vector(Unsigned(donvi_r) +1);
			end if ;
		end if ;
	end process;
------------------------------output state logic---------------------------------------------
	
	chuc 	<= chuc_r;
	donvi 	<= donvi_r;
end Behavioral;

