----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2021 03:29:23 PM
-- Design Name: 
-- Module Name: divisor - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisor is
Port (c: in std_logic;
ou: out std_logic
 );
end divisor;

architecture Behavioral of divisor is
signal ou_s: std_logic:= '0';
signal contador: std_logic_vector(25 downto 0):= "00000000000000000000000000";

begin
process(c)
begin
if(c = '1' and c'event) then
contador <= contador + '1';
if(contador(25) = '1') then
ou_s <= not ou_s;
contador <= "00000000000000000000000000";
end if;
end if;

ou <= ou_s;
end process;
end Behavioral;
