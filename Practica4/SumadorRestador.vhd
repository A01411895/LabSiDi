library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SumadorRestador is
Port(ss1, ss2: in std_logic_vector(7 downto 0);
Ccin: in std_logic;
Rr: out std_logic_vector(7 downto 0);
Ccout: out std_logic);
end SumadorRestador;

architecture Behavioral of SumadorRestador is
Component FullAdder is
Port(s1, s2: in std_logic;
Cin: in std_logic;
Cout: out std_logic;
R: out std_logic);
End component;

Signal cinn1, cinn2, cinn3, cinn4, cinn5, cinn6, cinn7, cinn8 :  std_logic;
Signal Rrr : std_logic_vector(7 downto 0) := x"00";
Signal Ccin_s: std_logic;
Signal nn: std_logic_vector(7 downto 0);

begin
nn(0) <= ss2(0) xor Ccin;
nn(1) <= ss2(1) xor Ccin;
nn(2) <= ss2(2) xor Ccin;
nn(3) <= ss2(3) xor Ccin;
nn(4) <= ss2(4) xor Ccin;
nn(5) <= ss2(5) xor Ccin;
nn(6) <= ss2(6) xor Ccin;
nn(7) <= ss2(7) xor Ccin;

DUT1: FullAdder port map(
s1 => ss1(0),
s2 => (nn(0)),
Cin => Ccin,
Cout => cinn1,
R => Rrr(0));

DUT2: FullAdder port map(
s1 => ss1(1),
s2 => (nn(1)),
Cin =>cinn1,
Cout => cinn2,
R => Rrr(1));

DUT3: FullAdder port map(
s1 => ss1(2),
s2 => (nn(2)),
Cin =>cinn2,
Cout => cinn3,
R => Rrr(2));

DUT4: FullAdder port map(
s1 => ss1(3),
s2 => (nn(3)),
Cin =>cinn3,
Cout => cinn4,
R => Rrr(3));

DUT5: FullAdder port map(
s1 => ss1(4),
s2 => (nn(4)),
Cin =>cinn4,
Cout => cinn5,
R => Rrr(4));

DUT6: FullAdder port map(
s1 => ss1(5),
s2 => (nn(5)),
Cin =>cinn5,
Cout => cinn6,
R => Rrr(5));

DUT7: FullAdder port map(
s1 => ss1(6),
s2 => (nn(6)),
Cin =>cinn6,
Cout => cinn7,
R => Rrr(6));

DUT8: FullAdder port map(
s1 => ss1(7),
s2 => (nn(7)),
Cin =>cinn7,
Cout => cinn8,
R => Rrr(7));

Rr <= Rrr;
Ccout <= cinn8;

end Behavioral;