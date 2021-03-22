library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEC7 is
    Port (BCDin : in STD_LOGIC_VECTOR (3 downto 0);
          Seven_Segment : out STD_LOGIC_VECTOR (7 downto 0));
end DEC7;

architecture Behavioral of DEC7 is

begin

process(BCDin)
begin
 
case BCDin is
when "0000" =>
Seven_Segment <= "11000000";
when "0001" =>
Seven_Segment <= "11111001";
when "0010" =>
Seven_Segment <= "10100100";
when "0011" =>
Seven_Segment <= "10110000";
when "0100" =>
Seven_Segment <= "10011001";
when "0101" =>
Seven_Segment <= "10010010";
when "0110" =>
Seven_Segment <= "10000010";
when "0111" =>
Seven_Segment <= "11111000";
when "1000" =>
Seven_Segment <= "10000000";
when "1001" =>
Seven_Segment <= "10010000";
when others =>
Seven_Segment <= "11111111";
end case;
 
end process;

end Behavioral;