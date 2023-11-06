----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:52 08/08/2023 
-- Design Name: 
-- Module Name:    dem_1so_ssud - Behavioral 
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

entity dem_1so_ssud is
	port(
		CKHT: 	in 	std_logic;
		rst: 	in 	std_logic;
		ena_ss: in 	std_logic;
		ena_db: in 	std_logic;
		ena_ud: in 	std_logic;
		donvi: 	out std_logic_vector(3 downto 0));
end dem_1so_ssud;

architecture Behavioral of dem_1so_ssud is
	Signal ena: std_logic := '0';
	Signal donvi_r, donvi_n: std_logic_vector(3 downto 0);
begin
	
	process(CKHT, rst, ena_ud)
	begin
		if (rst = '0') then
			if (ena_ud = '1') then
				donvi_r <= x"0";
			else
				donvi_r <= x"9";
			end if ;
		elsif (falling_edge(CKHT)) then
			donvi_r <= donvi_n;
		end if ;
	end process;

	ena <= ena_ss and ena_db;
	process(ena, donvi_r, ena_ud)
	begin
		donvi_n <= donvi_r;
		if (ena = '1' and ena_ud = '1') then
			if (donvi_r = x"9") then
				donvi_n <= x"0";
			else
				donvi_n <= std_logic_vector(Unsigned(donvi_r) + 1);
			end if ;
		elsif (ena = '1' and ena_ud = '0') then
			if (donvi_r = x"0") then
				donvi_n <= x"9";
			else
				donvi_n <= std_logic_vector(Unsigned(donvi_r) - 1);
			end if ;
		end if ;
	end process;

	donvi <= donvi_r;
end Behavioral;

