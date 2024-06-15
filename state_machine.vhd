library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity state_machine is	
    Port ( 
           clk : in STD_LOGIC;
           clkL: inout std_logic;
           reset : in STD_LOGIC;
           serial_data: in std_logic;
           enable : in STD_LOGIC;
           start : in STD_LOGIC;
           led_out: out std_logic_vector(11 downto 0);
           LED : out STD_LOGIC_VECTOR (11 downto 0);
           stop_out : out STD_LOGIC);
end state_machine;

architecture Behavioral of state_machine is
    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, DONE);
    signal state: state_type := S0;
    signal led_s: std_logic_vector(0 to 11) := "000000000000";
    signal stop_out_int: std_logic := '0';
     signal count : integer :=0;
signal b : std_logic :='0';

    constant password: std_logic_vector(0 to 11) := "000000010010";  

begin

process(clk) 
begin
    if(rising_edge(clk)) then
        count <=count+1;
            if(count = 49999999 ) then
                b <= not b;
                count <=0;
            end if;
    end if;
clkL<=b;
end process;


    process(clkL, reset)
    begin
        if reset = '1' then
            state <= S0;
            led_s <= "000000000000";
            stop_out_int <= '0';
        elsif rising_edge(clkL) then
            if start = '1' then
                    case state is
                        when S0 =>
                            if serial_data = password(0) then
                                led_s(0) <= '1';
                                state <= S1;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S1 =>
                            if serial_data = password(1) then
                                led_s(1) <= '1';
                                state <= S2;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S2 =>
                            if serial_data = password(2) then
                                led_s(2) <= '1';
                                state <= S3;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S3 =>
                            if serial_data = password(3) then
                                led_s(3) <= '1';
                                state <= S4;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S4 =>
                            if serial_data = password(4) then
                                led_s(4) <= '1';
                                state <= S5;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S5 =>
                            if serial_data = password(5) then
                                led_s(5) <= '1';
                                state <= S6;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S6 =>
                            if serial_data = password(6) then
                                led_s(6) <= '1';
                                state <= S7;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S7 =>
                            if serial_data = password(7) then
                                led_s(7) <= '1';
                                state <= S8;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S8 =>
                            if serial_data = password(8) then
                                led_s(8) <= '1';
                                state <= S9;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S9 =>
                            if serial_data = password(9) then
                                led_s(9) <= '1';
                                state <= S10;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S10 =>
                            if serial_data = password(10) then
                                led_s(10) <= '1';
                                state <= S11;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when S11 =>
                            if serial_data = password(11) then
                                led_s(11) <= '1';
                                state <= DONE;
                            else
                                stop_out_int <= '1';
                                state <= DONE;
                            end if;
                        when DONE =>
                            state <= DONE;
                    end case;
                end if;
            end if;
    
    led_out <= led_s;
    stop_out <= stop_out_int;
    end process;

end Behavioral;