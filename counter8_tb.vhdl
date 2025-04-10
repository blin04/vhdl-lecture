library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constants.all;

entity counter8_tb is
end entity counter8_tb;

architecture tb of counter8_tb is
    signal clk_int : std_logic;
    signal rst_int : std_logic;
    signal en_int : std_logic;
    signal ocnt_int : unsigned (7 downto 0);
begin

    uut : entity work.counter8(structural)
    port map (
        clk => clk_int,
        rst => rst_int,
        en => en_int,
        ocnt => ocnt_int
    );

    clock : process
    begin
        clk_int <= '0';
        wait for CLK_PERIOD;
        clk_int <= '1';
        wait for CLK_PERIOD;
    end process clock;

    stimulus : process 
    begin
        rst_int <= '0';
        en_int <= '1';
        wait for 15 * CLK_PERIOD;
        rst_int <= '1';
        en_int <= '0';
        wait for CLK_PERIOD;
        rst_int <= '0';
        en_int <= '1';
        wait for 30 * CLK_PERIOD;
        en_int <= '0';
        wait for 5 * CLK_PERIOD;
        wait;
    end process stimulus;

end architecture tb;