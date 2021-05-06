----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2021 06:09:55 PM
-- Design Name: 
-- Module Name: bit8 - Behavioral
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

entity bit8 is
   Port( 
   D: in std_logic_vector(7 downto 0);
   se: in std_logic_vector(1 downto 0);
   sr,sl, ck, cr: in std_logic;
   Q: out std_logic_vector(7 downto 0)
    );
end bit8;

architecture Behavioral of bit8 is
component bitshift IS
PORT (
	inp:		IN STD_LOGIC_VECTOR(3 downto 0);
	clk: 		IN STD_LOGIC;
	sd:	IN STD_LOGIC;
	si: 	IN STD_LOGIC;
	sel: 		IN STD_LOGIC_VECTOR(1 downto 0);
	clear: 		IN STD_LOGIC;
	outp: 	OUT STD_LOGIC_VECTOR(3 downto 0)
);
END component;

signal q1, q2 : std_logic_vector(3 downto 0);
signal ssl: std_logic:= D(4);
signal ssr: std_logic:= D(3);


begin


dut1: bitshift port map(
inp => D(7 downto 4),
clk => ck,
sd => sr,
si => q2(3),
sel => se,
clear => cr,
outp => q1
);

dut2: bitshift port map(
inp => D(3 downto 0),
clk => ck,
sd => q1(0),
si => sl,
sel => se,
clear => cr,
outp => q2

);

Q <= q1 & q2;


end Behavioral;