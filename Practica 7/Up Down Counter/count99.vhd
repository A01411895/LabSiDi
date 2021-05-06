----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2021 03:00:00 PM
-- Design Name: 
-- Module Name: count99 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity count99 is
Port (control, nt, np, clock: in std_logic;
Aa: in std_logic_vector(3 downto 0);
Bb: in std_logic_vector(3 downto 0);
sseg, san: out std_logic_vector(7 downto 0)
);
end count99;

architecture Behavioral of count99 is
component  mux is
Port (A, B: in std_logic_vector(3 downto 0);
s, clk: in std_logic;
o: out std_logic_vector(3 downto 0)
);
end component; 
component ls169 is
Port (D: in std_logic_vector(3 downto 0);
clk, ld, ud, ent, emp: in std_logic;
Q: out std_logic_vector(3 downto 0);
Rco: out std_logic
);
end component;
component load is 
Port (r1: in std_logic_vector(7 downto 0);
    con, rlj: in std_logic;
    lf1, lf2: out std_logic
 );
end component;
component DEC7 is 
Port (BCDin : in STD_LOGIC_VECTOR (3 downto 0);
    Seven_Segment : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component sSegDisplay is 
Port(ck : in  std_logic;                          -- 100MHz system clock
			number : in  std_logic_vector (63 downto 0); -- eight digit number to be displayed
			seg : out  std_logic_vector (7 downto 0);    -- display cathodes
			an : out  std_logic_vector (7 downto 0));
end component;

signal ckd2: std_logic;
signal y: std_logic_vector(3 downto 0);
signal ld_s, ld_s2: std_logic:= '1';
signal Rr: std_logic_vector(7 downto 0):= "00000001";
signal rrccoo, rrccoo1: std_logic;
signal dec, uni: std_logic_vector(7 downto 0);
signal numbers: std_logic_vector(63 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000";
signal notLS: std_logic;



begin

notLS <= not ld_s;

dut1: mux port map(
A => Aa,
B => Bb,
s => control,
clk => clock,
o => y
);

dut2: load port map(
r1 => Rr,
con => control,
rlj => clock,
lf1 =>ld_s,
lf2 => ld_s2
);

dut3: ls169 port map(
D => y,
clk => clock,
ld => ld_s,
ud => control,
ent => nt,
emp => np,
Q => Rr(3 downto 0),
Rco => rrccoo
);

dut4: ls169 port map(
D => y,
clk => notLS,
ld => ld_s2,
ud => control,
ent => nt,
emp => np,
Q => Rr(7 downto 4),
Rco => rrccoo1
);

dut5: DEC7 port map(
    BCDin => Rr(3 downto 0),
    Seven_Segment => uni
);

dut6: DEC7 port map(
    BCDin => Rr(7 downto 4),
    Seven_Segment => dec
);

numbers(15 downto 8) <= dec;
numbers(7 downto 0) <= uni;

dut7: sSegDisplay port map(
    ck => clock,
    number => numbers,
    seg => sseg,
    an => san
);

end Behavioral;
