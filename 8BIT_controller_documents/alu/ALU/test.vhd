library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
end ALU;

architecture Behavioral of ALU is
    -- Constants
    constant clk_period : time := 10 ns;
    constant bit_shift_num : natural := 1;
    
    -- Signals
    signal A, B : std_logic_vector(7 downto 0);
    signal ALU_sel : std_logic_vector(3 downto 0);
    signal NZVC : std_logic_vector(3 downto 0);
    signal result : std_logic_vector(7 downto 0);
    signal clk : std_logic := '0';
    
begin
    -- Instantiate the ALU module
    UUT: entity work.ALU
        port map (
            A => A,
            B => B,
            ALU_sel => ALU_sel,
            NZVC => NZVC,
            result => result
        );
    
    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;
    
    -- Test stimulus process
    stim_process: process
    begin
        -- Initial test values
        A <= "00000001";
        B <= "00000010";
        ALU_sel <= "0000";
        wait for 100 ns; 
        
        -- Test addition
        ALU_sel <= "0000";
        wait for 100 ns;
        
        -- Test subtraction
        ALU_sel <= "0001";
        wait for 100 ns;
        
        -- Test multiplication
        ALU_sel <= "0010";
        wait for 100 ns;
        
        -- Test division
        ALU_sel <= "0011";
        wait for 100 ns;
        
        -- Test logical shift left
        ALU_sel <= "0100";
        wait for 100 ns;
        
        -- Test logical shift right
        ALU_sel <= "0101";
        wait for 100 ns;
        
        -- Test rotate left
        ALU_sel <= "0110";
        wait for 100 ns;
        
        -- Test rotate right
        ALU_sel <= "0111";
        wait for 100 ns;
        
        -- Test logical AND
        ALU_sel <= "1000";
        wait for 100 ns;
        
        -- Test logical OR
        ALU_sel <= "1001";
        wait for 100 ns;
        
        -- Test logical XOR
        ALU_sel <= "1010";
        wait for 100 ns;
        
        -- Test logical NOR
        ALU_sel <= "1011";
        wait for 100 ns;
        
        -- Test logical NAND
        ALU_sel <= "1100";
        wait for 100 ns;
        
        -- Test logical XNOR
        ALU_sel <= "1101";
        wait for 100 ns;
        
        -- Test greater comparison
        ALU_sel <= "1110";
        wait for 100 ns;
        
        -- Test equal comparison
        ALU_sel <= "1111";
        wait for 100 ns;
        
        -- End of simulation
        wait;
    end process;
    
end Behavioral;
