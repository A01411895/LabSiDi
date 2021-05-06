----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2021 12:29:03 PM
-- Design Name: 
-- Module Name: tb_Calculadora - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Calculadora is

end tb_Calculadora;

architecture Behavioral of tb_Calculadora is
    component Calculadora is
    Port( 
            A, B: in std_logic_vector(7 downto 0);
            sel: in std_logic_vector(2 downto 0);
            sA, sB: in std_logic;
            sS: out std_logic;
            Salida: out std_logic_vector(7 downto 0)
            );
     end component;
     
     signal A_s, B_s: std_logic_vector(7 downto 0);
     signal sel_s: std_logic_vector(2 downto 0);
     signal sA_s, sB_s: std_logic;
     signal sS_s: std_logic;
     signal Salida_s: std_logic_vector(7 downto 0);
     
begin

    DUT: Calculadora port map(
    A => A_s,
    B => B_s,
    sel => sel_s,
    sA => sA_s,
    sB => sB_s,
    sS => sS_s,
    Salida => Salida_s);
    
    process
    begin
    A_s <= "00000101";
    B_s <= "00000011";
    sel_s <= "001";
    sA_s <= '0';
    sB_s <= '0';
   
    wait for 10 ns;
    
    A_s <= "00001001";
    B_s <= "00000100";
    sel_s <= "010";
    sA_s <= '0';
    sB_s <= '0';   
    
    wait for 10 ns;
    
    A_s <= "00000101";
    B_s <= "00000011";
    sel_s <= "100";
    sA_s <= '0';
    sB_s <= '0'; 
    
    wait for 10 ns;
    
    A_s <= "00001000";
    B_s <= "00000101";
    sel_s <= "001";
    sA_s <= '1';
    sB_s <= '1';     

    wait for 10 ns;
    
    A_s <= "00000110";
    B_s <= "00000010";
    sel_s <= "100";
    sA_s <= '0';
    sB_s <= '1';    
        
    wait;
    end process;
    
end Behavioral;
