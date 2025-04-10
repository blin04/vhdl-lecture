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

architecture structural of counter8 is
    signal current_val : std_logic_vector (7 downto 0) := (others => '0');
    signal next_val : std_logic_vector (7 downto 0) := (others => '0');
begin
    inc : entity work.adder8
    port map (
       ia => current_val,
       ib => "00000001",
       os => next_val,
       ocarry => open
    );
 
    gen_ff : for i in 0 to 7 generate
        ff : entity work.dff
        port map (
            d => next_val(i),
            clk => clk,
            rst => rst,
            en => en,
            q => current_val(i)
        );
    end generate;
     
    -- d1 : entity work.dff
    -- port map (
    --     d => data(1),
    --     clk => clk,
    --     rst => rst,
    --     en => en,
    --     q => result(1)
    -- );
    --  
    -- d2 : entity work.dff
    -- port map (
    --     d => data(2),
    --     clk => clk,
    --     rst => rst,
    --     en => en,
    --     q => result(2)
    -- );
    --  
    -- d3 : entity work.dff
    -- port map (
    --     d => data(3),
    --     clk => clk,
    --     rst => rst,
    --     en => en,
    --     q => result(3)
    -- );
    --  
    --  
    -- d4 : entity work.dff
    -- port map (
    --     d => data(4),
    --     clk => clk,
    --     rst => rst,
    --     en => en,
    --     q => result(4)
    -- );
    --  
    -- d5 : entity work.dff
    -- port map (
    --     d => data(5),
    --     clk => clk,
    --     rst => rst,
    --     en => en,
    --     q => result(5)
    -- );
    --  
    -- d6 : entity work.dff
    -- port map (
    --     d => data(6),
    --     clk => clk,
    --     rst => rst,
    --     en => en,
    --     q => result(6)
    -- );
    --  
    -- d7 : entity work.dff
    -- port map (
    --     d => data(7),
    --     clk => clk,
    --     rst => rst,
    --     en => en,
    --     q => result(7)
    -- );
    ocnt <= unsigned(current_val);

end architecture structural;

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
