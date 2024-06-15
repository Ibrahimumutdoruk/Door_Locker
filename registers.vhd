library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registers is
    generic (
        N : integer := 12
    );
    port (
        clk     : in  std_logic;
        r_in    : in  std_logic_vector (N-1 downto 0);
        enable  : in  std_logic; -- Enable for continuous shifting
        start   : in  std_logic; -- Start for single shift operation
        reset   : in  std_logic;
        dout   : out std_logic;
        clkL    : inout std_logic
    );
end registers;

architecture Behavioral of registers is

    signal din : std_logic_vector (N-1 downto 0) := "000000000000";
    signal count : integer :=0;
signal b : std_logic :='0';


begin

process(clk) 
begin
    if(rising_edge(clk)) then
        count <=count+  1;
            if(count = 49999999 ) then
                b <= not b;
                count <=0;
            end if;
    end if;
clkL<=b;
end process;
    codes : process (clkL, reset) 
    begin
        if reset = '1' then
            din <= "000000000000";
        elsif rising_edge(clkL) then
            if enable = '1' then
                din <= r_in; 
            elsif start = '1' then
                din <= '0' & din(N-1 downto 1); 
            end if;
        end if;
    end process;

    dout <= din(0); 

end Behavioral;