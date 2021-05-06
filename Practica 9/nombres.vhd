----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 04:36:02 PM
-- Design Name: 
-- Module Name: nombres - Behavioral
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

Entity nombres is
Port(clk: in std_logic;
s: out std_logic_vector(10 downto 0)
);
End nombres;

architecture Behavioral of nombres is

signal rs, rw, ck: std_logic;
signal db: std_logic_vector(10 downto 0):= "00000000000";
signal aux: std_logic_vector(1 downto 0):= "00";
signal clk_freq:  INTEGER:= 50;
signal clk_c: integer:= 0;

begin
process(clk)
begin
case db is when "00000000000" => 
if(clk_c < clk_freq*50000)then
db <= "00000000000";
clk_c <= clk_c + 1;
else
db <=  "10000111000";
clk_c <= 0;
end if;

when "10000111000" =>
if(clk_c < clk_freq*50000)then
db <= "10000111000";
clk_c <= clk_c + 1;
else
if(aux = "00") then
db <= "00000111000";
aux <= "00";
end if;
if (aux = "01") then
db <= "00000111000";
aux <= "01";
end if;
if (aux = "10") then
db <= "00000001111";
aux <= "10";
end if;
clk_c <= 0;
end if;

when "00000111000" =>
if(clk_c < clk_freq*50000)then
db <= "00000111000";
clk_c <= clk_c + 1;
else
if(aux = "00") then
aux <= "01";
db <= "10000111000";
end if;
if(aux = "01") then
aux <= "10";
db <= "10000111000";
end if;
clk_c <= 0;
end if;

when "00000001111" =>
if(clk_c < clk_freq*50000)then
db <= "00000001111";
clk_c <= clk_c + 1;
else
if(aux = "10") then
aux <= "11";
db <= "10000001111";
end if;
if(aux = "11") then
db <= "10000001111";
aux <= "00";
end if;
clk_c <= 0;
end if;

when "10000001111" =>
if(clk_c < clk_freq*50000)then
db <= "10000001111";
clk_c <= clk_c + 1;
else
if (aux = "11") then
db <= "00000001111";
aux <= "11";
else 
db <= "01001001101";
end if;
clk_c <= 0;
end if;


when "01001001101" =>
db <= "11001001101";

when "11001001101" =>
db <= "01001000001";

when  "01001000001" =>
db <= "11001000001";

when "11001000001" =>
db <= "01001010010";

when "01001010010" =>
db <= "11001010010";

when "11001010010" => 
db <= "01001000011";

when  "01001000011" =>
db <= "11001000011";

when "11001000011" =>
db <= "01001001111";

when "01001001111" =>
db <= "11001001111";

when "11001001111" =>
db <= "01001010011";

when "01001010011" =>
db <= "11001010011";

when "11001010011" =>
db <= "01001100000";

when "01001100000" =>
db <= "11001100000";

when "11001100000" =>
db <= "01001001100";

when "01001001100" =>
db <= "11001001100";

when "11001001100" =>
db <= "01001010101";

when "01001010101" =>
db <= "11001010101";

when "11001010101" =>
db <= "01001001001";

when "01001001001" =>
db <= "11001001001";


when others =>
db <= "10000000010";

end case;

s <= db;

end process;

end Behavioral;

