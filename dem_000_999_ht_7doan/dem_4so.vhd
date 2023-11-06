----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:26:24 08/06/2023 
-- Design Name: 
-- Module Name:    dem_4so - Behavioral 
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

entity dem_4so is
	port(
		ena_db: in 	std_logic;
		ena_ss: in 	std_logic;
		CKHT: 	in 	std_logic;
		rst: 	in 	std_logic;
		donvi: 	out std_logic_vector(3 downto 0);
		chuc: 	out std_logic_vector(3 downto 0);
		tram: 	out std_logic_vector(3 downto 0);
		nghin: 	out std_logic_vector(3 downto 0));
end dem_4so;

architecture Behavioral of dem_4so is
	Signal ena: 				std_logic;
	signal donvi_r, donvi_n: 	std_logic_vector(3 downto 0);
	signal chuc_r, chuc_n: 		std_logic_vector(3 downto 0);
	signal tram_r, tram_n: 		std_logic_vector(3 downto 0);
	signal nghin_r, nghin_n: 	std_logic_vector(3 downto 0);
begin
	ena <= ena_db and ena_ss;

	process(CKHT, rst)
	begin
		if (rst = '0') then
			donvi_r <= (others => '0');
			chuc_r 	<= (others => '0');
			tram_r 	<= (others => '0');
			nghin_r <= (others => '0');
		elsif (falling_edge(CKHT)) then
			donvi_r <= donvi_n;
			chuc_r 	<= chuc_n;
			tram_r 	<= tram_n;
			nghin_r <= nghin_n;
		end if ;
	end process;

	process(donvi_r, chuc_r, tram_r, nghin_r, ena)
	begin
		donvi_n <= donvi_r;
		chuc_n 	<= chuc_r;
		tram_n 	<= tram_r;
		nghin_n	<= nghin_r;
		if (ena = '1') then
			if (nghin_r = x"1" and tram_r = x"2" and chuc_r = x"3" and donvi_r = x"4") then
				nghin_n <= x"0";
				tram_n 	<= x"0";
				chuc_n 	<= x"0";
				donvi_n <= x"0";
			elsif (donvi_r = x"9") then donvi_n <= x"0";
				if (chuc_r = x"9") then chuc_n <= x"0";
					if (tram_r = x"9") then tram_n <= x"0";
						nghin_n <= std_logic_vector(Unsigned(nghin_r) + 1);
					else tram_n <= std_logic_vector(Unsigned(tram_r) + 1);
					end if ;
				else chuc_n <= std_logic_vector(Unsigned(chuc_r) + 1);
				end if ;
			else donvi_n <= std_logic_vector(Unsigned(donvi_r) + 1);
			end if ;
		end if ;
	end process;

	nghin 	<= nghin_r;
	tram 	<= tram_r;
	chuc 	<= chuc_r;
	donvi 	<= donvi_r;

end Behavioral;

