----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2021 07:45:19 PM
-- Design Name: 
-- Module Name: sr8 - Behavioral
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

Entity sr8 is
Port(ss1, ss2: in std_logic_vector(7 downto 0);
Ccin: in std_logic;
Rr: out std_logic_vector(7downto 0);
Ccout: out std_logic);
End sr8;

Architecture behavioral of sr8 is
Component fullader is
Port(s1, s2: in std_logic;
Cin: in std_logic;
Cout: out std_logic;
R: out std_logic);
End component;
Signal cinn1, cinn2, cinn3, cinn4, cinn5, cinn6, cinn7, cinn8 :  std_logic;
Signal ss1_s, ss2_s, Rrr : std_logic_vector(7 downto 0);
Signal Ccin_s: std_logic;

Begin
DUT1: fullader port map(
s1 => (ss1_s(0)),
s2 => ss2_s(0),
Cin => Ccin_s,
Cout => cinn1,
R => Rrr(0));

DUT2: fullader port map(
s1 => (ss1_s(1)),
s2 => ss2_s(1),
Cin =>cinn1,
Cout => cinn2,
R => Rrr(1));

DUT3: fullader port map(
s1 => (ss1_s(2)),
s2 => ss2_s(2),
Cin =>cinn2,
Cout => cinn3,
R => Rrr(2));

DUT4: fullader port map(
s1 => (ss1_s(3)),
s2 => ss2_s(3),
Cin =>cinn3,
Cout => cinn4,
R => Rrr(3));

DUT5: fullader port map(
s1 => (ss1_s(4)),
s2 => ss2_s(4),
Cin =>cinn4,
Cout => cinn5,
R => Rrr(4));

DUT6: fullader port map(
s1 => (ss1_s(5)),
s2 => ss2_s(5),
Cin =>cinn5,
Cout => cinn6,
R => Rrr(5));

DUT7: fullader port map(
s1 => (ss1_s(6)),
s2 => ss2_s(6),
Cin =>cinn6,
Cout => cinn7,
R => Rrr(6));

DUT8: fullader port map(
s1 => (ss1_s(7)),
s2 => ss2_s(7),
Cin =>cinn7,
Cout => cinn8,
R => Rrr(7));

Rr <= Rrr;
Ccout <= cinn8;

End Behavioral;