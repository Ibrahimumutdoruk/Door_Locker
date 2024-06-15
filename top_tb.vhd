library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is

    component top is
        generic (
            N : integer := 12
        );
        port (
            clk         :   in  std_logic;
            sw          :   in  std_logic_vector (N-1 downto 0);
            enable      :   in  std_logic;
            start       :   in  std_logic;
            reset       :   in  std_logic;

            LED         :   out  std_logic_vector (N-1 downto 0);
            clk_o       :   out  std_logic;
            stop_o      :   out  std_logic
            
        );
    end component;
    component clk1Hz is
    Port (
        clk_in          : in  STD_LOGIC;
        clk_out         : out STD_LOGIC
    );
    end component;
    component shift_register_piso is
    generic (
    N : integer := 12
    );
    port ( 
    clk         :   in  std_logic;
    r_in        :   in  std_logic_vector (N-1 downto 0);
    start       : in  std_logic;
    enable      :   in  std_logic;
    reset       :   in  std_logic;
    
    r_out       :   out  std_logic_vector (N-1 downto 0)
    );
    end component;
    component SM is
    generic (
    N : integer := 12
    );
    port ( 
    clk         :   in  std_logic;
    s_in        :   in  std_logic_vector (N-1 downto 0);
    enable      :   in  std_logic;
    start       :   in  std_logic;
    reset       :   in  std_logic;
    
    LED       :   out  std_logic_vector (N-1 downto 0) := "000000000000";
    stop_out    :   out  std_logic
    
    
    );
    end component;        
        
  
    signal clk_tb        : std_logic := '0';
    signal sw_tb         : std_logic_vector(11 downto 0) := "000000000000";
    signal enable_tb     : std_logic := '0';
    signal start_tb      : std_logic := '0';
    signal reset_tb      : std_logic := '0';
    signal LED_tb        : std_logic_vector(11 downto 0);
    signal clk_o_tb      : std_logic;
    signal stop_o_tb     : std_logic;
    

    constant clk_period  : time := 20 ns;

begin

    uut: top
        generic map (
            N => 12
        )
        port map (
            clk     => clk_tb,
            sw      => sw_tb,
            enable  => enable_tb,
            start   => start_tb,
            reset   => reset_tb,
            LED     => LED_tb,
            clk_o   => clk_o_tb,
            stop_o  => stop_o_tb
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
    
        reset_tb <= '0';
        enable_tb <= '0';
        start_tb <= '0';
        sw_tb <= (others => '0');
        wait for clk_period*5;

        
        enable_tb <= '0';
        wait for clk_period*5;
        enable_tb <= '0';
        wait for clk_period*50;
        enable_tb <= '0';
        wait for clk_period*5;

        start_tb <= '0';
        wait for clk_period*5;
        start_tb <= '0';
        wait for clk_period*50;
        start_tb <= '0';
        wait for clk_period*5;
        wait for clk_period*100;
        reset_tb <= '1';
        wait for clk_period*5;
        reset_tb <= '0';
        wait for clk_period*50;
        reset_tb <= '0';
       
        sw_tb <= "000000010010"; 
        enable_tb <= '0';
        wait for clk_period*5;
        enable_tb <= '1';
        wait for clk_period*50;
        enable_tb <= '0';
        wait for clk_period*5;

        -- Start the state machine
        start_tb <= '0';
        wait for clk_period*5;
        start_tb <= '0';
        wait for clk_period*50;
        start_tb <= '0';
        wait for clk_period*5;
        wait for clk_period*100;
        
        reset_tb <= '0';
        wait for clk_period*5;
        reset_tb <= '1';
        wait for clk_period*50;
        reset_tb <= '0';
        wait for clk_period*5;
        
        sw_tb <= "000000010010"; 
        enable_tb <= '0';
        wait for clk_period*5;
        enable_tb <= '1';
        wait for clk_period*50;
        enable_tb <= '0';
        wait for clk_period*5;

        -- Start the state machine
        start_tb <= '0';
        wait for clk_period*5;
        start_tb <= '1';
        wait for clk_period*50;
        start_tb <= '0';
        wait for clk_period*5;

        -- Observe the LEDs and other outputs
        wait for clk_period*100;
        -- Apply reset
        reset_tb <= '0';
        wait for clk_period*5;
        reset_tb <= '1';
        wait for clk_period*20;
        reset_tb <= '0';
        wait for clk_period*5;
        
        sw_tb <= "000000010010"; 
        enable_tb <= '0';
        wait for clk_period*5;
        enable_tb <= '1';
        wait for clk_period*50;
        enable_tb <= '0';
        wait for clk_period*5;

        start_tb <= '0';
        wait for clk_period*5;
        start_tb <= '1';
        wait for clk_period*50;
        start_tb <= '0';
        wait for clk_period*5;

        
        wait for clk_period*500;
     
        wait;
    end process;

end Behavioral;