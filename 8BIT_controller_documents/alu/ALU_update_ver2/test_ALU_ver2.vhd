--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:30:40 07/15/2023
-- Design Name:   
-- Module Name:   C:/Users/Hau Tran/Desktop/alu/ALU_update_ver1.0/ALU_test_ver1.vhd
-- Project Name:  ALU_update_ver1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_test_ver1 IS
END ALU_test_ver1;
 
ARCHITECTURE behavior OF ALU_test_ver1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         ALU_sel : IN  std_logic_vector(3 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal ALU_sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
   signal result : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_sel => ALU_sel,
          NZVC => NZVC,
          result => result
        );

   -- Clock process definitions
   --clock_process :process
   --begin
	--	clock <= '0';
	--	wait for 5 ns;
	--	clock <= '1';
	--	wait for 5 ns;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       -- Initial test values
        --A <= "01111111";
        --B <= "00000010";
        --ALU_sel <= "0000";
        --wait for 100 ns;
        
        -- Test addition
		  --A <= "01111111";
        --B <= "00000010";
        --ALU_sel <= "0000";
        --wait for 100 ns;
        
        -- Test subtraction
		  --A <= "01111111";
        --B <= "10000000";
        --ALU_sel <= "0001";
        --wait for 100 ns;
        
        -- Test multiplication
		  A <= "00001111";
        B <= "00000000";
        ALU_sel <= "0011";	
        wait for 100 ns;
        
        -- Test division
		  A <= "11111111";
        B <= "10000000";
        ALU_sel <= "0010";
        wait for 100 ns;
		  
		  
        
        -- Test logical shift left
		  --A <= "00000001";
        --ALU_sel <= "0100";
        --wait for 100 ns;
        
        -- Test logical shift right
		  --A <= "01000000";
        --ALU_sel <= "0101";
        --wait for 100 ns;
        
        -- Test rotate left
        --ALU_sel <= "0110";
        --wait for 100 ns;
        
        -- Test rotate right
        --ALU_sel <= "0111";
        --wait for 100 ns;
        
        -- Test logical AND
        --ALU_sel <= "1000";
        --wait for 100 ns;
        
        -- Test logical OR
        --ALU_sel <= "1001";
        --wait for 100 ns;
        
        -- Test logical XOR
        --ALU_sel <= "1010";
        --wait for 100 ns;
        
        -- Test logical NOR
        --ALU_sel <= "1011";
        --wait for 100 ns;
        
        -- Test logical NAND
        --ALU_sel <= "1100";
        --wait for 100 ns;
        
        -- Test logical XNOR
        --ALU_sel <= "1101";
        --wait for 100 ns;
        
        -- Test greater comparison
        --ALU_sel <= "1110";
        --wait for 100 ns;
        
        -- Test equal comparison
        --ALU_sel <= "1111";
        --wait for 100 ns;
        
        -- End of simulation
        wait;
   end process;

END;
