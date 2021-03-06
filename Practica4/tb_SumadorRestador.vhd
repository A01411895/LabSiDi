library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_SumadorRestador is
--  Port ( );
end tb_SumadorRestador;

architecture Behavioral of tb_SumadorRestador is
component SumadorRestador is
    Port(   ss1, ss2: in std_logic_vector(7 downto 0);
            Ccin: in std_logic;
            Rr: out std_logic_vector(7 downto 0);
            Ccout: out std_logic);
end component;

--ENTRADAS
SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL T : STD_LOGIC := '0';

--SALIDAS
SIGNAL C_flag, Ov_flag : STD_LOGIC;
SIGNAL R : STD_LOGIC_VECTOR(7 DOWNTO 0);

CONSTANT period : TIME := 5 ns;

begin
DUT : SumadorRestador
PORT MAP(ss1 => A,
         ss2 => B,
         Ccin => T,
         Rr => R,
         Ccout => C_flag);

PROCESS
BEGIN
    --RESET
    WAIT FOR 50 NS;
    WAIT FOR PERIOD * 10;
    
    --ESTIMULOS DE SUMA
    T <= '0';
    
    A <= x"07"; -- 7 
    B <= x"04"; -- 4
    WAIT FOR PERIOD * 10;
    A <= x"0F"; -- 15
    B <= x"FA"; -- -6
    WAIT FOR PERIOD * 10;
    A <= x"10"; -- 16
    B <= x"E8"; -- -24
    WAIT FOR PERIOD * 10;
    A <= x"FB"; -- -5
    B <= x"F7"; -- -9
    WAIT FOR PERIOD * 10;
    A <= x"7D"; -- 125
    B <= x"3A"; -- 58
    WAIT FOR PERIOD * 10;
    
    --ESTIMULOS DE RESTA
    T <= '1';
    
    A <= x"0F"; -- 15
    B <= x"06"; -- 6
    WAIT FOR PERIOD * 10;
    A <= x"10"; -- 16
    B <= x"18"; -- 24
    WAIT FOR PERIOD * 10;
    A <= x"82"; -- -125
    B <= x"34"; -- 58
    WAIT FOR PERIOD * 10;
    A <= x"FA"; -- -6
    B <= x"0C"; -- 13
    WAIT FOR PERIOD * 10;
    A <= x"00"; -- 0
    B <= x"00"; -- 0
    
    WAIT;
    END PROCESS;
end Behavioral;