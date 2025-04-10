library ieee;
use ieee.std_logic_1164.all;

use work.constants.all;

entity dff_tb is
end entity dff_tb;

architecture tb of dff_tb is
    signal d_int : std_logic;
    signal clk_int : std_logic;
    signal rst_int : std_logic;
    signal en_int : std_logic;
    signal q_int : std_logic;
begin

    uut : entity work.dff
    port map (
        d => d_int,
        clk => clk_int,
        rst => rst_int,
        en => en_int,
        q => q_int
    );

    clock : process
    begin
        clk_int <= '0';
        wait for CLK_PERIOD / 2;
        clk_int <= '1';
        wait for CLK_PERIOD / 2;
    end process clock;

    stimulus : process 
    begin
        wait for 0.2 * CLK_PERIOD;
        en_int <= '0';
        d_int <= '1';
        wait for CLK_PERIOD;
        en_int <= '1';
        wait for CLK_PERIOD;
        rst_int <= '1';
        d_int <= '0';
        wait for CLK_PERIOD;
        rst_int <= '1';
        wait for CLK_PERIOD;
        rst_int <= '0';
        d_int <= '1';
        wait for CLK_PERIOD;
        en_int <= '0';
        wait for CLK_PERIOD;
        rst_int <= '1';
        wait for CLK_PERIOD;
        rst_int <= '0';
        wait;
    end process stimulus;

end architecture tb;