library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Practica3 is
    Port ( A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           P1 : in STD_LOGIC;
           P2 : in STD_LOGIC;
           P3 : in STD_LOGIC);
end Practica3;

architecture Behavioral of Practica3 is

begin
A <= (P1 AND P2 AND P3);
B <= (NOT P1 OR NOT P2 OR NOT P3);
C <= (P2 AND P3) OR (P1 AND P3) OR (P1 AND P2);
D <= (NOT P1 AND NOT P2) OR (NOT P1 AND NOT P3) OR (NOT P2 AND NOT P3);


end Behavioral;