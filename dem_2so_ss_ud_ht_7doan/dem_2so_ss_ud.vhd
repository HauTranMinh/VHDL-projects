----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:05 08/13/2023 
-- Design Name: 
-- Module Name:    dem_2so_ss_ud - Behavioral 
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

entity dem_2so_ss_ud is
	port(
		CKHT: 	in std_logic;
		rst: 	in std_logic;
		ena_ss: in std_logic;
		ena_ud: in std_logic;
		ena_db: in std_logic;
		donvi: 	out std_logic_vector(3 downto 0);
		chuc: 	out std_logic_vector(3 downto 0));
end dem_2so_ss_ud;

architecture Behavioral of dem_2so_ss_ud is
	Signal donvi_r, donvi_n: std_logic_vector(3 downto 0);
	Signal chuc_n, chuc_r: std_logic_vector(3 downto 0);
	Signal ena: std_logic := '0';
begin
	
	process(CKHT, rst, ena_ud)
	begin
		if (rst = '0') then
			if (ena_ud = '1') then donvi_r <= x"0";
									chuc_r <= x"0";
			elsif (ena_ud = '0') then donvi_r <= x"9";
										chuc_r <= x"9";
			end if ;
		elsif (rising_edge(CKHT)) then
			donvi_r <= donvi_n;
			chuc_r 	<= chuc_n; 
		end if ;
	end process;

	ena <= ena_ss and ena_db;

	process(donvi_r, chuc_r, ena, ena_ud)
	begin
		chuc_n <= chuc_r;
		donvi_n <= donvi_r;
		if (ena = '1' and ena_ud = '1') then
			if (chuc_r = x"9" and donvi_r = x"9") then
				chuc_n <= x"0";
				donvi_n <= x"0";
			elsif (donvi_r = x"9") then donvi_n <= x"0";
									chuc_n <= std_logic_vector(Unsigned(chuc_r) + 1);
			else
				donvi_n <= std_logic_vector(Unsigned(donvi_r) + 1);
			end if ;
		elsif (ena = '1' and ena_ud = '0') then
			if (chuc_r = x"0" and donvi_r = x"0") then
				chuc_n <= x"9";
				donvi_n <= x"9";
			elsif (donvi_r = x"0") then donvi_n <= x"9";
									chuc_n <= std_logic_vector(Unsigned(chuc_r) - 1);
			else
				donvi_n <= std_logic_vector(Unsigned(donvi_r) - 1);
			end if ;
		end if ;
	end process;

	donvi <= donvi_r;
	chuc <= chuc_r;

end Behavioral;

