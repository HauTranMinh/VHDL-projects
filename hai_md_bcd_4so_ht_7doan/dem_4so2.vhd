----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:36 08/07/2023 
-- Design Name: 
-- Module Name:    dem_4so2 - Behavioral 
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

entity dem_4so2 is
	port(
		CKHT: 	in 	std_logic;
		ena_db: in 	std_logic;
		ena_ss: in 	std_logic;
		rst: 	in 	std_logic;
		donvi: 	out std_logic_vector(3 downto 0);
		chuc: 	out std_logic_vector(3 downto 0);
		tram: 	out std_logic_vector(3 downto 0);
		nghin: 	out std_logic_vector(3 downto 0));
end dem_4so2;

architecture Behavioral of dem_4so2 is
	Signal ena: 		std_logic;
	signal donvi_r: 	std_logic_vector(3 downto 0) := x"4";
	Signal donvi_n:		std_logic_vector(3 downto 0);
	signal chuc_r: 		std_logic_vector(3 downto 0) := x"3";
	Signal chuc_n:		std_logic_vector(3 downto 0);
	signal tram_r: 		std_logic_vector(3 downto 0) := x"2";
	signal tram_n:		std_logic_vector(3 downto 0);
	signal nghin_r: 	std_logic_vector(3 downto 0) := x"1";
	signal nghin_n:		std_logic_vector(3 downto 0);
begin
	
	ena <= ena_db and ena_ss;

	process(CKHT, rst)
	begin
		if (rst = '0') then
			donvi_r 	<= x"4";
			chuc_r 		<= x"3";
			tram_r 		<= x"2";
			nghin_r 	<= x"1";
		elsif (rising_edge(CKHT)) then
			nghin_r <= nghin_n;
			tram_r 	<= tram_n;
			chuc_r 	<= chuc_n;
			donvi_r <= donvi_n;
		end if ;
	end process;
-------------------------------------------------------------------------------------------
	process(donvi_r, chuc_r, tram_r, nghin_r, ena)
	begin
		donvi_n <= donvi_r;
		chuc_n 	<= chuc_r;
		tram_n 	<= tram_r;
		nghin_n <= nghin_r;
		if (ena = '1') then
			if (nghin_r = x"0" and tram_r = x"0" and chuc_r = x"0" and donvi_r = x"0") then
				donvi_n 	<= x"4";
				chuc_n 		<= x"3";
				tram_n 		<= x"2";
				nghin_n 	<= x"1";
			elsif (donvi_r = x"0") then donvi_n <= x"9";
				if (chuc_r = x"0") then chuc_n <= x"9";
					if (tram_r = x"0") then tram_n <= x"9";
						nghin_n <= std_logic_vector(Unsigned(nghin_r) - 1);
					else tram_n <= std_logic_vector(Unsigned(tram_r) - 1);
					end if ;
				else chuc_n <= std_logic_vector(Unsigned(chuc_r) - 1);	
				end if ;
			else donvi_n <= std_logic_vector(Unsigned(donvi_r) - 1);
			end if ;
		end if ;
	end process;
-------------------------------------------------------------------------------------------
	donvi 	<= donvi_r;
	chuc 		<= chuc_r;
	tram 		<= tram_r;
	nghin 	<= nghin_r;

end Behavioral;

