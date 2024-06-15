library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity clock_divide is
port(
     clk:  in std_logic;
     clkL: out std_logic
     );
     end clock_divide;
    architecture Behavioral of clock_divide is
    
     signal count : integer :=0;
signal b : std_logic :='0';

begin
process(clk) 
begin 
    if(rising_edge(clk)) then
        count <=count+1;
            if(count = 50000000) then
                b <= not b;
                count <=0;
            end if;
    end if;
clkL<=b;
end process;



end Behavioral;