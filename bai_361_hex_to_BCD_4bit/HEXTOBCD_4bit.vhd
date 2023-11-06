library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.math_real.all;

entity HEXTOBCD_4bit is
    port (
        sohex_4bit : in  std_logic_vector(3 downto 0);
        chuc       : out std_logic_vector(3 downto 0);
        donvi      : out std_logic_vector(3 downto 0)
    );
end HEXTOBCD_4bit;

architecture Behavioral of HEXTOBCD_4bit is
begin
    process(sohex_4bit)
        variable bcd_hex : std_logic_vector(11 downto 0);
        variable dem     : integer range 0 to 3;
    begin
        bcd_hex := "00000000" & sohex_4bit;
        dem := 3;
        while dem > 0 loop
            bcd_hex := bcd_hex(10 downto 0) & '0';
            dem := dem - 1;
            if bcd_hex(7 downto 4) >= "0101" then
                bcd_hex(7 downto 4) := std_logic_vector(unsigned(bcd_hex(7 downto 4)) + x"3");
            end if;
        end loop;
		  bcd_hex := bcd_hex(10 downto 0) & '0';
        chuc <= not( bcd_hex(11 downto 8));
        donvi <= not (bcd_hex(7 downto 4));
    end process;
end Behavioral;
