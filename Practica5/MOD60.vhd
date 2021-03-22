library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MOD60 is
    Port ( clk2 : in STD_LOGIC;
           d : out STD_LOGIC_VECTOR(3 downto 0);
           u : out STD_LOGIC_VECTOR(3 downto 0));
end MOD60;

architecture behavioral of MOD60 is

component MOD6 is
port(clk1: in std_logic;
r: out std_logic_vector(3 downto 0));
end component;

component MOD10 is
Port ( clk1, ress: in STD_LOGIC;
           r : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal ru: std_logic_vector(3 downto 0):= "0000";
signal rd: std_logic_vector(3 downto 0):= "0000";
signal p: std_logic;

begin

p <= clk2 AND (ru(0) AND ru(3));


DUT1: MOD10 port map(
clk1 => clk2,
ress => '0',
r => ru);

DUT2: MOD6 port map(
clk1 => p,
r => rd);

d <= rd;
u <= ru;  

end behavioral;