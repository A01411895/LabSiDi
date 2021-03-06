library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder is
    Port ( s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           R : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

begin

R <= (s1 XOR s2) XOR Cin;
Cout<= (s1 AND s2) OR (s1 AND Cin) OR (s2 AND Cin);

end Behavioral;