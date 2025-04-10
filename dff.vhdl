library ieee;
use ieee.std_logic_1164.all;

-- synchronous D flip flop
entity dff is 
    port (
        signal d : in std_logic;
        signal clk : in std_logic;
        signal rst : in std_logic;
        signal en : in std_logic;
        signal q : out std_logic
    );
end entity dff;

architecture behave of dff is 
begin
    process (clk) begin
        if rising_edge(clk) and en = '1' then
            if rst = '1' then
                q <= '0';
            else
                q <= d;
            end if;
        end if;
    end process;
end architecture behave;