LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY bitshift IS
PORT (
	inp:		IN STD_LOGIC_VECTOR(3 downto 0);
	clk: 		IN STD_LOGIC;
	sd:	IN STD_LOGIC;
	si: 	IN STD_LOGIC;
	sel: 		IN STD_LOGIC_VECTOR(1 downto 0);
	clear: 		IN STD_LOGIC;
	outp: 	OUT STD_LOGIC_VECTOR(3 downto 0)
);
END bitshift;

ARCHITECTURE behavioral OF bitshift IS

signal inp_s, outp_s, aux: std_logic_vector(3 downto 0);
signal clk_s, sd_s, si_s, clear_s: std_logic;
signal sel_s: std_logic_vector(1 downto 0);


begin

process(clk)
begin
if(clk = '1' AND clk'event)then
if(clear = '0') then
    outp_s <= "0000";
end if;

if(sel = "01" AND clear = '1' AND sd = '1')then
    outp_s <= '1' & (outp_s(3 downto 1));
    
end if;
if(sel = "01" AND clear = '1' AND sd = '0')then
   outp_s <= '0' & (outp_s(3 downto 1));
end if;
if(sel = "10" AND clear = '1' AND si = '1')then
     outp_s <= (outp_s(2 downto 0)) & '1';
end if;
if(sel = "10" AND clear = '1' AND si = '0')then
    outp_s <= (outp_s(2 downto 0)) & '0';
end if;
if(sel = "00" AND clear = '1')then
    outp_s <= outp_s;
end if;
if(sel = "11" AND clear = '1')then
    outp_s <= inp;
end if;
end if;

end process;

outp <= outp_s;


END behavioral;
