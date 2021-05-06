----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2021 05:23:54 PM
-- Design Name: 
-- Module Name: load - Behavioral
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

entity load is
Port (r1: in std_logic_vector(7 downto 0);
    con, rlj: in std_logic;
    lf1, lf2: out std_logic
 );
end load;

architecture Behavioral of load is
signal llff, llff2: std_logic;
begin
process(rlj)
begin
if(rlj = '1' and rlj'event)then
llff <= not(((R1(3) and (not R1(0))) and con) or (((not R1(0)) and (not R1(1)) and (not R1(2)) and (not R1(3)))and (not con)));
llff2 <= not(((R1(7) and R1(4)) and con) or (((not R1(4)) and (not R1(5)) and (not R1(6)) and (not R1(7)))and (not con)));
end if;

lf1<= llff;
lf2<= llff2;

end process;
end Behavioral;