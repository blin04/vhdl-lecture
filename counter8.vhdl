library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter8 is
    port (
        -- signal d : in std_logic_vector (7 downto 0);
        signal clk : in std_logic;
        signal rst : in std_logic;
        signal en : in std_logic;
        -- signal wr : in std_logic;
        signal ocnt : out unsigned (7 downto 0)
    );
end entity counter8;

architecture behavioral of counter8 is
    signal data : unsigned (7 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                data <= "00000000";
            elsif en = '1' then
                data <= data + 1;
            end if;
        end if;
        ocnt <= data;
    end process;

end architecture behavioral;
