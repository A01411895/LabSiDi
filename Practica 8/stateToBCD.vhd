library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity StateToBCD is
Port(
    state: in std_logic_vector(2 downto 0);
    degreeuni: out std_logic_vector(3 downto 0);
    degreedec: out std_logic_vector(3 downto 0);
    degreehun: out std_logic_vector(3 downto 0)
);
end StateToBCD;

architecture Behavioral of StateToBCD is

begin
process(state)
begin
    if state="001" then
        degreeuni<= "0000";
        degreedec<= "0000";
        degreehun<= "0000";
    elsif state="010" then
        degreeuni<= "0101";
        degreedec<= "0100";
        degreehun<= "0000";
    elsif state="011" then
        degreeuni<= "0000";
        degreedec<= "1001";
        degreehun<= "0000";
    elsif state="100" then
        degreeuni<= "0101";
        degreedec<= "0011";
        degreehun<= "0001";
    elsif state="101" then
        degreeuni<= "0000";
        degreedec<= "1000";
        degreehun<= "0001";
    else
        degreeuni<= "0000";
        degreedec<= "0000";
        degreehun<= "0000";
    end if;
end process;
end Behavioral;