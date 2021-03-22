library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MOD10 is
    Port ( clk1, ress: in STD_LOGIC;
           r : out STD_LOGIC_VECTOR(3 downto 0));
end MOD10;

architecture behavioral of MOD10 is

component jk is
port(J, K, clk, res: in std_logic;
Q, Qn: out std_logic);
end component;

signal s2, s3, s4, s5: std_logic:= '0';
signal s52, ns2, ns3, s32, ns4, s43, ns5: std_logic:= '0';
signal s1: std_logic:= '1';
signal res1: std_logic:= '0';


begin

res1 <= s52 OR ress;
s52 <= s5 AND s2;
s32 <= s3 AND s2;
s43 <= s32 AND s4;
ns2 <= NOT s2;
ns3 <= NOT s3;
ns4 <= NOT s4;
ns5 <= NOT s5;


DUT1: jk port map(
J => s1,
K => s1,
clk => clk1,
res => res1,
Q => s2,
Qn => ns2);

DUT2: jk port map(
J => s2,
K => s2,
clk => clk1,
res => res1,
Q => s3,
Qn => ns3);

DUT3: jk port map(
J => s32,
K => s32,
clk => clk1,
res => res1,
Q => s4,
Qn => ns4);

DUT4: jk port map(
J => s43,
K => s43,
clk => clk1,
res => res1,
Q => s5,
Qn => ns5);


r(0) <= s2;
r(1) <= s3;
r(2) <= s4;
r(3) <= s5;

end behavioral;