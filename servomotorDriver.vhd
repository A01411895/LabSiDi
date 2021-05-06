library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ServomotorDriver is
Port(
    clk, pos, reset: in std_logic;
    pwm: out std_logic;
    sseg: out std_logic_vector(7 downto 0);
    san: out std_logic_vector(7 downto 0)
);
end ServomotorDriver;

architecture Behavioral of ServomotorDriver is

component StateToBCD is
Port(
    state: in std_logic_vector(2 downto 0);
    degreeuni: out std_logic_vector(3 downto 0);
    degreedec: out std_logic_vector(3 downto 0);
    degreehun: out std_logic_vector(3 downto 0)
);
end component;

component DEC7 is
    Port (BCDin: in STD_LOGIC_VECTOR (3 downto 0);
          Seven_Segment: out STD_LOGIC_VECTOR (7 downto 0));
end component;

component sSegDisplay is
    Port(ck : in  std_logic;                          -- 100MHz system clock
			number : in  std_logic_vector (63 downto 0); -- eight digit number to be displayed
			seg : out  std_logic_vector (7 downto 0);    -- display cathodes
			an : out  std_logic_vector (7 downto 0));
end component;

type stateType is (S0, S45, S90, S135, S180);
subtype u20 is unsigned(19 downto 0);
signal counter      : u20 := x"00000";

signal currentState, nextState : stateType;
signal state: std_logic_vector(2 downto 0) := "000";
constant clk_freq   : integer := 100_000_000;       -- Clock frequency in Hz (10 ns)
constant pwm_freq   : integer := 50;                -- PWM signal frequency in Hz (20 ms)
constant period     : integer := clk_freq/pwm_freq; -- Clock cycle count per PWM period
signal duty_cycle   : integer := 0;            -- Clock cycle count per PWM duty cycle

signal uni, dec, hun: std_logic_vector(3 downto 0) := "0000";
signal unisev, decsev, hunsev: std_logic_vector(7 downto 0) := "00000000";
signal numbers: std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";

signal pwm_counter  : std_logic := '0';

begin

DUT1: StateToBCD port map(
    state=> state,
    degreeuni=> uni,
    degreedec=> dec,
    degreehun=> hun
);

DUT2: DEC7 port map(
    BCDin=> uni,
    Seven_Segment=> unisev
);

DUT3: DEC7 port map(
    BCDin=> dec,
    Seven_Segment=> decsev
);

DUT4: DEC7 port map(
    BCDin=> hun,
    Seven_Segment=> hunsev
);

DUT5: sSegDisplay port map(
    ck=> clk,
	number=> numbers,
	seg=> sseg,
	an=> san
);

numbers(23 downto 16)<= hunsev;
numbers(15 downto 8)<= decsev;
numbers(7 downto 0)<= unisev;

syncProcess: process(reset, clk)
variable cur : u20 := counter;
begin
	if (reset = '1') then
        currentState <= S0;
    elsif (rising_edge(clk)) then
        currentState <= nextState;
        if pos = '1' then
            cur := cur + 1;  
            counter <= cur;
            if (cur <= duty_cycle) then
                pwm_counter <= '1'; 
            elsif (cur > duty_cycle) then
                pwm_counter <= '0';
            elsif (cur = period) then
                cur := x"00000";
            end if;
        end if;
    end if;
end process syncProcess;

combProcess: process(currentState, pos)
begin
	case currentState is
		when S0 =>
		    duty_cycle <= 50_000;
		    state<= "001";
			if (pos'event and pos='1') then
				nextState <= S45;
			else
				nextState <= S0;
			end if;
		when S45 =>
			duty_cycle <= 100_000;
			state<= "010";
			if (pos'event and pos='1') then
				nextState <= S90;
			else
				nextState <= S45;
			end if;
		when S90 =>
		    duty_cycle <= 150_000;
            state<= "011";
            if (pos'event and pos='1') then
                nextState <= S135;
            else
                nextState <= S90;
            end if;
		when S135 =>
		    duty_cycle <= 200_000;
            state<= "100";
            if (pos'event and pos='1') then
                nextState <= S180;
            else
                nextState <= S135;
            end if;
		when S180 =>
		    duty_cycle <= 250_000;
            state<= "101";
            if (pos'event and pos='1') then
                nextState <= S0;
            else
                nextState <= S180;
             end if;
		when others =>
		    nextState <= S0;
	end case;
end process combProcess;

pwm <= pwm_counter;

end Behavioral;