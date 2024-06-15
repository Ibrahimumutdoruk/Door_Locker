library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        serial_data: in std_logic;
        enable : in STD_LOGIC;
        start : in STD_LOGIC;
        led_out: out std_logic_vector(11 downto 0);
        LED : out STD_LOGIC_VECTOR (11 downto 0);
        stop_out : out STD_LOGIC;
        r_out : out std_logic
    );
end top;

architecture Behavioral of top is

    signal clkL : std_logic;
    signal r_in : std_logic_vector(11 downto 0);

    signal sm_led_out : std_logic_vector(11 downto 0);
    signal sm_stop_out : std_logic;
    signal piso_out : std_logic;

begin

    myclock_divider : entity work.clock_divide
        port map (
            clk => clk,
            clkL => clkL
        );
     state_machine: entity work.state_machine
        port map (
            clk => clk,
            reset => reset,
            serial_data => serial_data,
            enable => enable,
            start => start,
            led_out => sm_led_out,
            LED => LED,
            stop_out => sm_stop_out
        );

    
    Dflipflops : entity work.registers
        generic map (
            N => 12
        )
        port map (
            clk => clk,
            r_in => sm_led_out, 
            enable => enable,
            start => start,
            reset => reset,
            dout => piso_out,
            clkL => clkL
        );

    led_out <= sm_led_out;
    stop_out <= sm_stop_out;
    r_out <= piso_out;

end Behavioral;