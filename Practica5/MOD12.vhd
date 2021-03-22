library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MOD12 is
    Port ( clk3 : in STD_LOGIC;
           u,d : out STD_LOGIC_VECTOR(3 downto 0));
end MOD12;

architecture behavioral of MOD12 is

component MOD10
Port ( clk1, ress: in STD_LOGIC;
        r : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component jk is
port(J, K, clk, res: in std_logic;
Q, Qn: out std_logic);
end component;

signal ru, rd: std_logic_vector(3 downto 0):= "0000";
signal n3: std_logic;
signal en, dis, diss: std_logic; 

begin

n3 <= not rd(0);
en <= ru(3) and ru(0);
dis <= NOT ru(3) AND NOT ru(2) AND ru(1) AND NOT ru(0);
diss <= dis AND rd(0);

DUT1: MOD10 port map(
clk1 => clk3,
ress => diss,
r => ru);

DUT2: jk port map(
J => en,
K => '0',
clk => clk3,
res => dis,
Q => rd(0),
Qn => n3);

    u <= ru;
    d <= "000" & rd(0);

end behavioral;