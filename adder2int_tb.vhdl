library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder2int_tb is
end entity adder2int_tb;

architecture tb of adder2int_tb is
    signal ta : integer := 0;
    signal tb : integer := 0;
    signal ts : integer;
begin

    uut : entity work.adder2int 
    port map (
        ia => ta,
        ib => tb,
        os => ts
    );

    stimulus : process
    begin
        ta <= 21; 
        tb <= 21;
        wait for 50 ns;
        ta <= 0;
        tb <= 0;
        wait for 50 ns;
        wait;
    end process stimulus;

end architecture tb;