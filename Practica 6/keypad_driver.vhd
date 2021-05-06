----------------------------------------------------------------------------------
-- Company: Tecnológico de Monterrey
-- Engineer: Matías Vázquez Piñón
-- 
-- Create Date: 03/24/2021 09:50:10 PM
-- Design Name: 4x4 Keypad Driver
-- Module Name: keypad_driver - Behavioral
-- Target Devices: NEXYS 4 DDR 
-- Description: 
-- 
-- Revision 0.01 - File Created
-- Additional Comments:
-- +------------+
-- | 1  2  3  A |
-- | 4  5  6  B |
-- | 7  8  9  C |
-- | *  0  #  D |
-- +------------+
--    ||||||||
--    ||||||||
--    ||||||||
--    87654321
--    rows
--        cols
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keypad_driver is
    Port (clk         : in  std_logic;
          cols        : in  std_logic_vector(3 downto 0);  -- Read columns depening upon pressed key (0111 to 1110)
          rows        : out std_logic_vector(3 downto 0);  -- Hardware-swept rows (0111 to 1110)
          key         : out std_logic_vector(3 downto 0)); -- Binary code for pressed key
end keypad_driver;

architecture Behavioral of keypad_driver is
begin
process(clk)
    variable counter : std_logic_vector(10 downto 0); -- Variable used for frequency division: 100MHz/2^10 = 100kHz^. This is the sweep frequency
    begin
    if rising_edge(clk) then
        counter := counter + 1;
        case counter(10 downto 8) is 
            when "000" => rows <= "0111"; -- Row 1 active
            when "001" => if    cols = "0111" then key <= x"1"; -- Column 1
                          elsif cols = "1011" then key <= x"2"; -- Column 2
                          elsif cols = "1101" then key <= x"3"; -- Column 3
                          elsif cols = "1110" then key <= x"A"; -- Column 4
                          end if;                  
            when "010" => rows <= "1011"; -- Row 2 active         
            when "011" => if    cols = "0111" then key <= x"4"; -- Column 1
                          elsif cols = "1011" then key <= x"5"; -- Column 2
                          elsif cols = "1101" then key <= x"6"; -- Column 3
                          elsif cols = "1110" then key <= x"B"; -- Column 4 
                          end if;                  
            when "100" => rows <= "1101"; -- Row 3 active          
            when "101" => if    cols = "0111" then key <= x"7"; -- Column 1
                          elsif cols = "1011" then key <= x"8"; -- Column 2
                          elsif cols = "1101" then key <= x"9"; -- Column 3
                          elsif cols = "1110" then key <= x"C"; -- Column 4 
                          end if;                  
            when "110" => rows <= "1110"; -- Row 4 active          
            when "111" => if    cols = "0111" then key <= x"E"; -- Column 1 (*)
                          elsif cols = "1011" then key <= x"0"; -- Column 2
                          elsif cols = "1101" then key <= x"F"; -- Column 3 (#)
                          elsif cols = "1110" then key <= x"D"; -- Column 4 
                          end if;
            when others => key <= x"0000";
        end case;              
    end if;
end process;
end Behavioral;