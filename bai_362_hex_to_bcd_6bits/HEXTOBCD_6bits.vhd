----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:46:29 07/21/2023 
-- Design Name: 
-- Module Name:    HEXTOBCD_6bits - Behavioral 
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
use IEEE.numeric_std.ALL;
use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HEXTOBCD_6bits is
	port(
		sohex_6bits: 	in 	STD_LOGIC_vector(5 downto 0);
		chuc: 			out std_logic_vector(3 downto 0);
		donvi: 			out std_logic_vector(3 downto 0));
end HEXTOBCD_6bits;

architecture Behavioral of HEXTOBCD_6bits is
begin
	process(sohex_6bits)
		variable bcd_hex: std_logic_vector(13 downto 0);
		variable dem: integer range 0 to 5;
	begin
		bcd_hex := "00000000" & sohex_6bits;
		dem := 5;
		while dem > 0 loop
            bcd_hex := bcd_hex(12 downto 0) & '0';
            dem := dem - 1;
            if bcd_hex(9 downto 6) >= "0101" then
                bcd_hex(9 downto 6) := std_logic_vector(unsigned(bcd_hex(9 downto 6)) + x"3");
            end if;
        end loop;
			bcd_hex := bcd_hex(12 downto 0) & '0';
        chuc <= not(bcd_hex(13 downto 10));
        donvi <=  not(bcd_hex(9 downto 6));


	end process;

end Behavioral;

