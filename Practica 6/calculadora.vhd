----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2021 11:36:12 AM
-- Design Name: 
-- Module Name: Calculadora - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Calculadora is
Port( 
        A, B: in std_logic_vector(7 downto 0);
        sel: in std_logic_vector(2 downto 0);
        sA, sB: in std_logic;
        sS: out std_logic;
        Salida: out std_logic_vector(7 downto 0)
        );
end Calculadora;

architecture Behavioral of Calculadora is

signal Resultado: std_logic_vector(7 downto 0);
    
begin
    process (A, B, sel)
    begin
        case(sel) is
           when "001" =>
           if(sA = '0' AND sB = '0') then
           Resultado <= A + B;
           sS <= '0';
           end if;
           
           if(sA = '0' AND sB = '1') then
           Resultado <= A - B;
           if(A >= B) then
           sS <= '0';
           elsif(A < B) then
           sS <= '1';
           end if;
           end if;
           
           if(sA = '1' AND sB = '0') then
           Resultado <= B - A;
           if(B >= A) then
           sS <= '0';
           elsif(B < A) then
           sS <= '1';
           end if;
           end if;
           
           
           if(sA = '1' AND sB = '1') then
           Resultado <= A + B;
           sS <= '1';
           end if;
            
                              
           when "010" =>
           if(sA = '0' AND sB = '0') then
           Resultado <= A - B;
           if(A >= B) then
           sS <= '0';
           elsif(A < B) then
           sS <= '1';
           end if;
           end if;
                
           if(sA = '0' AND sB = '1') then
           Resultado <= A + B;          
           sS <= '0';
           end if;
          
                
           if(sA = '1' AND sB = '0') then
           Resultado <= B + A;         
           sS <= '1';
           end if;
           
          if(sA = '1' AND sB = '1') then
          Resultado <= B - A;
          if(B >= A) then
          sS <= '0';
          elsif(B < A) then
          sS <= '1';
          end if;
          
          end if;
           
           
            when "100" =>
                Resultado <= std_logic_vector(to_unsigned( to_integer(unsigned(A)) * to_integer(unsigned(B)),8));
                if(sA = '1' AND sB = '1') then
                sS <= '0';
                elsif(sA = '0' AND sB = '0') then
                sS <= '0';
                elsif (sA = '1' AND sB = '0') then
                sS <= '1';
                elsif (sA = '0' AND sB = '1') then
                sS <= '1';
                end if;
            
            when others => Resultado <= "00000000";    
        end case;
    end process;
Salida <= Resultado;
end Behavioral;
