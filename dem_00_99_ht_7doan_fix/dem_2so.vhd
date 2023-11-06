----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:35:03 08/05/2023 
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
		ena_db: 	in 	std_logic;
		ena_ss: 	in 	std_logic;
		rst: 		in 	std_logic;
		CKHT: 		in 	std_logic;
		donvi: 		out std_logic_vector(3 downto 0);
		chuc: 		out std_logic_vector(3 downto 0));
end dem_2so;

architecture Behavioral of dem_2so is
	Signal ena: std_logic;
	Signal chuc_r, chuc_n: 		std_logic_vector(3 downto 0);
	Signal donvi_r, donvi_n: 	std_logic_vector(3 downto 0);
begin
---------------------------------------------------------------------------
	process(CKHT, rst)
	begin
		if (rst = '0') then
			chuc_r <= x"0";
			donvi_r <= x"0";
		elsif (falling_edge(CKHT)) then
			chuc_r <= chuc_n;
			donvi_r <= donvi_n;
		end if ;
	end process;
---------------------------------------------------------------------------
	ena <= ena_db and ena_ss;
	process(chuc_r, donvi_r, ena)
	begin
		donvi_n  <= donvi_r;
		chuc_n 	<= chuc_r;
		if (ena = '1') then
			if (chuc_r = x"9" and donvi_r = x"9") then
				donvi_n <= x"0";
				chuc_n <= x"0";
			elsif (donvi_r = x"9") then
				donvi_n <= x"0";
				chuc_n <= std_logic_vector(Unsigned(chuc_r) + 1);
			else
				donvi_n <= std_logic_vector(Unsigned(donvi_r) + 1);
			end if ;

		end if ;
	end process;

	chuc <= chuc_r;
	donvi <= donvi_r;
end Behavioral;

