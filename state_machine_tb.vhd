library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity state_machine_tb is
end state_machine_tb;

architecture Behavioral of state_machine_tb is
    
    component state_machine
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            serial_data: in std_logic;
            enable : in STD_LOGIC;
            start : in STD_LOGIC;
            led_out: out std_logic_vector(0 to 11);
            stop_out : out STD_LOGIC
        );
    end component;

    
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal serial_data: std_logic:= '0';
    signal enable : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal led_out: std_logic_vector (0 to 11);
    signal stop_out : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin
    
    uut: state_machine
        Port map (
            clk => clk,
            reset => reset,
            serial_data=>serial_data,
            enable => enable,
            start => start,
            led_out=>led_out,
            stop_out => stop_out
        );

    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    
    stim_proc: process
    begin		
        reset <= '1';
        wait for 100 ns;	
        reset <= '0';
        
        start <= '1';

        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '1'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '1'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        
        wait for 100 ns;

        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        
       
        start <= '1';
         serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '1'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        serial_data <= '1'; wait for clk_period;
        serial_data <= '0'; wait for clk_period;
        
        wait for 100 ns;
        
        wait;
    end process;

end Behavioral;