library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MOD6 is
    Port ( clk1 : in STD_LOGIC;
           r : out STD_LOGIC_VECTOR(3 downto 0));
end MOD6;

architecture behavioral of MOD6 is

component jk is
port(J, K, clk, res: in std_logic;
Q, Qn: out std_logic);
end component;

signal  s2, s3, s4: std_logic:= '0';
signal s24, ns2, ns3, s32, sn4: std_logic;
signal s1: std_logic:= '1';

begin
s24 <= s4 AND s2;
ns2 <= not s2;
ns3 <= not s3;
s32 <= s3 AND s2;
sn4 <= NOT s4;

DUT1: jk port map(
J => s1,
K => s1,
clk => clk1,
res => s24,
Q => s2,
Qn => ns2);

DUT2: jk port map(
J => s2,
K => s2,
clk => clk1,
res => (s24),
Q => s3,
Qn => ns3);

DUT3: jk port map(
J => s32,
K => s32,
clk => clk1,
res => s24,
Q => s4,
Qn => sn4);


r(0) <= s2;
r(1) <= s3;
r(2) <= s4;
r(3) <= '0';

end behavioral;