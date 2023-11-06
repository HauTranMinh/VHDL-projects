----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:26:02 07/12/2023 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
	generic(
			MAX_VAL : integer := 2**30; --30 bit counter (can modify depend on purpose) -- 
			SYNCH_Reset: boolean := true);
	port(
			max_count : 	out std_logic;
			clk : 			in std_logic;
			reset: 			in std_logic);

end counter;

architecture Behavioral of counter is
	-- convert MAX_VAL into integer --
	constant BIT_DEPTH: integer := integer(ceil(log2(real(MAX_VAL))));

	Signal count_reg: unsigned(BIT_DEPTH - 1 downto 0) := (others => '0');

begin
	
	synch_rst : if SYNCH_Reset = true generate
		count_proc: process(clk)
			begin
				if (rising_edge(clk)) then
					if ((Reset = '0') or (Count_reg = MAX_VAL)) then
						count_reg <= (others => '0');
					else
						count_reg <= count_reg + 1;
					end if ;
				end if ;

			end process count_proc;

	end generate;

	asynch_rst : if SYNCH_Reset = false generate
		count_proc: process(clk, reset)
			begin
				if (reset = '0') then
					count_reg <= (others => '0');
				elsif rising_edge(clk) then
					if (count_reg = MAX_VAL) then
						count_reg <= (others => '0');
					else
						count_reg <= count_reg + 1;
					end if ;
				end if ;
			end process count_proc;

	end generate;

	output_proc: process(count_reg)
		begin
			max_count <= '0';
			if(count_reg = MAX_VAL) then
				max_count <= '1';
			end if;
		end	process output_proc;
end Behavioral;

