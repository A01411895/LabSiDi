library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           clk : in STD_LOGIC;
           res : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qn : out STD_LOGIC);
end jk;

architecture behavioral of jk is
signal t: std_logic:= '0';
begin

process(clk, res)
begin

if(clk='1' and clk'event) then

if(res = '1') then
 t <= '0';
end if;

if(J='0' and K='0' and res='0')then
t <= t;
elsif(J='1' and K='1' and res='0')then
t <= not t;

elsif(J='0' and K='1' and res='0')then
t <= '0';

elsif(J='1' and K='0' and res='0')then
t <= '1';

end if;
end if;

Q<=t;
Qn <= not t;

end process;

end behavioral;