library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

Entity lcd is
Port(clk: in std_logic;
r: out std_logic_vector(10 downto 0)
);
End lcd;

Architecture behavioral of lcd is

signal rs, rw, ck: std_logic;

component divisor is
Port (c: in std_logic;
ou: out std_logic
 );
end component;

component nombres is
Port(clk: in std_logic;
s: out std_logic_vector(10 downto 0)
);
End component;


begin
dut1: divisor port map(
c => clk,
ou => ck
);

dut2: nombres port map(
clk => clk,
s => r
);

End behavioral;
