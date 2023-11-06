----------------------------------------------------------------------------------
-- Company: 
-- Engineer: HAU TRAN
-- 
-- Create Date:    14:03:18 07/13/2023 
-- Design Name:    ALU_8BIT
-- Module Name:    ALU - Behavioral 
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
--------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------------
entity ALU is
    generic ( constant bit_shift_num: natural := 1);  -- number of shited or rotated bits

    port(
        A, B    : in  std_logic_vector(7 downto 0); -- 2 channel 8 bit input --
        ALU_sel : in  std_logic_vector(3 downto 0); -- control signal --
        NZVC    : out std_logic_vector(3 downto 0); -- flag -- 
        result  : out std_logic_vector(7 downto 0)); -- 8 bit output --   

end ALU; 

--------------------------------------------------------------------------------------

architecture Behavioral of ALU is
    signal ALU_result : std_logic_vector(7 downto 0);
    signal ALU_ADD: std_logic_vector(8 downto 0);  
    signal C, Z, V, N, add_ov, sub_ov, mul_ov, div_ov: std_logic; 
begin
  process(ALU_sel, A, B)
    begin
      ALU_ADD <= "000000000";

      if ((B = x"00") and (ALU_sel = "0011")) then
        ALU_Result <= x(others => 'Z');
      else
        case( ALU_sel ) is
        when "0000" => -- Add
              ALU_ADD <= ('0' & A) + ('0' & B);
              ALU_result <= A + B;
        when "0001" => -- SUB  
              ALU_Result <= B - A;       
              ALU_ADD <= ('0' & B) - ('0' & A);       
        when "0010" => -- Multiplication
              ALU_Result <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),8)) ;
              ALU_ADD <= ('0' & B) - ('0' & A); 
        when "0011" => -- Division
              ALU_Result <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),8)) ; -- solved --
              ALU_ADD <= ('0' & B) - ('0' & A); 
        when "0100" => -- Logical shift left
              ALU_Result <= std_logic_vector(unsigned(A) sll bit_shift_num);
        when "0101" => -- Logical shift right
              ALU_Result <= std_logic_vector(unsigned(A) srl bit_shift_num);
        when "0110" => --  Rotate left
              ALU_Result <= std_logic_vector(unsigned(A) rol bit_shift_num);
        when "0111" => -- Rotate right
              ALU_Result <= std_logic_vector(unsigned(A) ror bit_shift_num);
        when "1000" => -- Logical and 
              ALU_Result <= A and B;
        when "1001" => -- Logical or
              ALU_Result <= A or B;
        when "1010" => -- Logical xor 
              ALU_Result <= A xor B;
        when "1011" => -- Logical nor
              ALU_Result <= A nor B;
        when "1100" => -- Logical nand 
              ALU_Result <= A nand B;
        when "1101" => -- Logical xnor
              ALU_Result <= A xnor B;
        when "1110" => -- Greater comparison
         if(A>B) then
              ALU_Result <= x"01" ;   
         else
              ALU_Result <= x"00" ;
         end if; 
        when "1111" => -- Equal comparison   
         if(A=B) then
          ALU_Result <= x"01" ;
         else
          ALU_Result <= x"00" ;
         end if;
        when others => ALU_Result <= A + B ;
       end case ; 
      end if ;
    end process;
--------------------negative flag---------------------------------------
  result <= ALU_Result;
  N <= ALU_Result(7); -- MSB = '1' mean Negative numbers '0' means others wise -- 
----------------------zero flag-----------------------------------------
  Z <= '1' when ALU_Result = x"00" else '0';

---------------- ---Overflow flag---------------------------------------  
   add_ov<= (A(7) and B(7)    and (not ALU_Result(7))) or ((not A(7))and (not B(7)) and ALU_Result(7));  
   sub_ov<= (A(7) and (not B(7)) and (not ALU_Result(7))) or ((not A(7))and B(7)    and ALU_Result(7));
   mul_ov<= (A(7) and B(7) and ALU_Result(7)) or ((not A(7)) and (not B(7)) and (not ALU_Result(7)));
   div_ov<= (A(7) and B(7) and ALU_Result(7)) or ((not A(7)) and (not B(7)) and (not ALU_Result(7)));   
   with ALU_Sel select  
    V    <= add_ov when "0000",  
            sub_ov when "0001",
            mul_ov when "0010",
            div_ov when "0011",
            '0' when others;  
-------------------- Carry out flag-------------------------------------  
   with ALU_Sel select  
    C <=  ALU_ADD(8) when "0000",  
          ALU_ADD(8) when "0001",
          ALU_ADD(8) when "0010",  
          ALU_ADD(8) when "0011",
          '0' when others;  
      NZVC <= N & Z & V & C;  


end Behavioral;