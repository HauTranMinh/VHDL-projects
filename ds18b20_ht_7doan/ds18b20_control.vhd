----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:42:11 08/14/2023 
-- Design Name: 
-- Module Name:    ds18b20_control - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ds18b20_control is
	port(
		CKHT: 		in 		std_logic;
		rst: 		in 		std_logic;
		ds18b20: 	inout 	std_logic;
		ds_pre: 	out 	std_logic;
		nhietdo: 	out 	std_logic_vector(11 downto 0));
end ds18b20_control;

architecture Behavioral of ds18b20_control is
	Constant ml_skip_rom: 	std_logic_vector(7 downto 0) := x"cc";
	Constant ml_convert: 	std_logic_vector(7 downto 0) := x"44";
	Constant ml_read_ram: 	std_logic_vector(7 downto 0) := x"be";
	type state_type is (
		reset,
		skip_rom,
		write_byte,
		write_bit0,
		write_bit1,
		read_bit,
		convert_t,
		read_scart,
		get_temp,
		wait_4ms);

	Signal state: state_type := reset;

	Signal j: 		integer range 0 to 200001 	:= 0;
	Signal k: 		integer range 0 to 13		:= 0;

	Signal tt: 		integer range 0 to 4		:= 0;
	Signal tt_rst:  integer range 0 to 3 		:= 0;

	Signal tt_wr_b0: integer range 0 to 1 		:= 0;
	Signal tt_wr_b1: integer range 0 to 2		:= 0;
	Signal tt_rd_b: 	integer range 0 to 3	:= 0;

	Signal ds_in: std_logic;
	Signal ds_out: std_logic;
	Signal ds_ena: std_logic;

	Signal dlg: std_logic_vector(7 downto 0) := x"00";
	Signal dln: std_logic_vector(11 downto 0);
begin
	
	ds18b20 <= ds_out when ds_ena = '1' else 'Z';

	process(state, CKHT, rst)
	begin
		if (rst = '0') then
			state 		<= reset;
			tt 			<= 0;
			tt_wr_b0 	<= 0;
			tt_wr_b1 	<= 0;
			k 			<= 0;
			tt_rd_b 	<= 0;
			dlg 		<= "00000001";
		end if ;
	end process;

				

end Behavioral;

