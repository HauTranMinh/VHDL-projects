----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:35 08/14/2023 
-- Design Name: 
-- Module Name:    ds18b20_ht_7doan - Behavioral 
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

entity ds18b20_ht_7doan is
	port(
		CKHT: 		in 		std_logic;
		sw: 		in 		std_logic;
		btn: 		in 		std_logic;
		ds18b20: 	inout 	std_logic;
		led: 		out 	std_logic_vector(3 downto 0);
		triac: 		out 	std_logic;
		sseg: 		out 	std_logic_vector(7 downto 0);
		anode: 		out 	std_logic_vector(7 downto 0));
end ds18b20_ht_7doan;

architecture Behavioral of ds18b20_ht_7doan is
	Signal dc_8led: 	std_logic_vector(7 downto 0);
	Signal ena_8led: 	std_logic_vector(7 downto 0);
	---------------------------------------------------
	Signal ena1khz: 	std_logic;
	Signal ds_pre: 		std_logic;
	Signal rst: 		std_logic;
	---------------------------------------------------
	Signal nhietdo: 	std_logic_vector(11 downto 0);
	Signal ndo_ng: 		std_logic_vector(7 downto 0);
	Signal ndo_tp: 		std_logic_vector(3 downto 0);
	---------------------------------------------------
	Signal ndo_dv, ndo_ch, ndo_tr: std_logic_vector(3 downto 0);
	
begin
	 
	rst <= btn;
	triac <= sw;
	dc_8led <= x"00" when ds_pre = '0' else
			x"ff";

	ena_8led <= x"ff";

	ndo_ng <= nhietdo(11 downto 4);
	ndo_tp <= nhietdo(3 downto 0);

	led <= ndo_tp;

	IC1: entity work.ds18b20_control
		port map(
			CKHT 	=> CKHT,
			rst 	=> rst,
			ds18b20 => ds18b20,
			nhietdo => nhietdo,
			ds_pre 	=> ds_pre);

	IC2: entity work.CHIA_10ena
		port map(
			CKHT => CKHT,
			ena1khz => ena1khz);

	IC3: entity work.hextobcd_8bit
		port map(
			sohex8bit => ndo_ng,
			donvi => ndo_dv,
			chuc => ndo_ch,
			tram => ndo_tr);


	IC4: entity work.GT_HT_8LED
		port map(
			led70 => x"f",
			led71 => x"f",
			led72 => x"f",
			led73 => ndo_tr,
			led74 => ndo_ch,
			led75 => ndo_dv,
			led76 => x"a",
			led77 => x"c",
			dc_8led => dc_8led,
			ena_8led => ena_8led,
			CKHT => CKHT,
			ena1khz => ena1khz,
			sseg => sseg,
			anode => anode);
end Behavioral;

