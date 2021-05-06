
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
Port (A, B: in std_logic_vector(3 downto 0);
s, clk: in std_logic;
o: out std_logic_vector(3 downto 0)
);
end mux;

architecture Behavioral of mux is
signal s_s: std_logic_vector(3 downto 0);

begin
process(clk)
begin
if(clk = '1' and clk'event) then
if(s = '0') then
s_s <= A;
else
s_s <= B;
end if;
end if;
end process;
o <= s_s;
end Behavioral;
