
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

entity ls169 is
Port (D: in std_logic_vector(3 downto 0);
clk, ld, ud, ent, emp: in std_logic;
Q: out std_logic_vector(3 downto 0);
Rco: out std_logic
);
end ls169;

architecture Behavioral of ls169 is
signal q_s: std_logic_vector(3 downto 0):="0000";
signal r: std_logic;

begin
process(clk)
begin


if(clk = '1' and clk'event)then
if(ld = '0') then
q_s <= D;
end if;

if(ld = '1')then
if(ent = '0' and emp = '0') then
if(ud = '1' and q_s /= "1111") then
q_s <= q_s + '1';
r <= '1';
elsif(ud = '1' and q_s = "1111")then
q_s <= "0000";
r <= '0';
end if;
if(ud = '0' and q_s /= "0000") then
q_s <= q_s - '1';
r <= '1';
elsif(ud = '0' and q_s = "0000")then
q_s <= "1001";
r <= '0';
end if;
end if;


end if;

end if;

Q <= q_s;

end process;



end Behavioral;
