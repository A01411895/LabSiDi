library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reloj is
    Port (clk : in STD_LOGIC;
          sseg, san: out std_logic_vector(7 downto 0):= "00000000";
          clkf: out STD_LOGIC        
          );
end reloj;

architecture behavioral of reloj is

component MOD60 is
port(clk2: in std_logic;
d: out std_logic_vector(3 downto 0);
u: out std_logic_vector(3 downto 0));
end component;


component MOD12 is
port(clk3: in std_logic;
u, d: out std_logic_vector(3 downto 0));
end component;

component DEC7 is
Port (BCDin : in STD_LOGIC_VECTOR (3 downto 0);
Seven_Segment : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component DClock is
port ( clk,reset: in std_logic;
clock_out: out std_logic);
end component;

component sSegDisplay is
    Port(ck : in  std_logic;                          -- 100MHz system clock
        number : in  std_logic_vector (63 downto 0); -- eight digit number to be displayed
        seg : out  std_logic_vector (7 downto 0);    -- display cathodes
        an : out  std_logic_vector (7 downto 0));
 end component;

signal min_dec,min_uni, seg_dec, seg_uni, hrs_uni, hrs_dec: STD_LOGIC_VECTOR(3 downto 0);
signal sd, su, md, mu, hd, hu: std_logic_vector(3 downto 0):= "0000";
signal en1, en2, clkT, clkT2, clks: std_logic:='0'; 
signal huDEC, hdDEC, muDEC, mdDEC: std_logic_vector(7 downto 0):= "00000000";  
signal numbers: std_logic_vector(63 downto 0);

begin

en1 <= (sd(2) AND sd(0)) AND (su(3) AND su(0));
clkT <= clk AND en1;

en2 <= (md(2) AND md(0)) AND (mu(3) AND mu(0));
clkT2 <= clkT AND en2;
numbers <= "11111111111111111111111111111111" & hdDEC & huDEC & mdDEC & muDEC;

DUT1: MOD60 port map(
clk2 => clks,
d => sd,
u => su);

DUT2: MOD60 port map(
clk2 => clkT,
d => md,
u => mu);

DUT3: MOD12 port map(
clk3 => clkT2,
u => hu,
d => hd);

hrs_dec <= hd;
hrs_uni <= hu;
min_dec <= md;
min_uni <= mu;
seg_dec <= sd;
seg_uni <= su;
  
DUT4: DEC7 port map(
BCDIN => mu,
Seven_Segment => muDEC);

DUT5: DEC7 port map(
BCDIN => md,
Seven_Segment => mdDEC);

DUT6: DEC7 port map(
BCDIN => hu,
Seven_Segment => huDEC);

DUT7: DEC7 port map(
BCDIN => hd,
Seven_Segment => hdDEC);

DUT8: DClock port map(
clk => clk,
reset => '0',
clock_out => clks);

DUT9: sSegDisplay port map(
ck => clk,
number => numbers,
seg => sseg,
an => san);

clkf <= clks;

end behavioral;