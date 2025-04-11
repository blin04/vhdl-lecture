library ieee;
use ieee.std_logic_1164.all;

entity adder2_tb is
end entity adder2_tb;

architecture tb of adder2_tb is
	signal ta : std_logic_vector(1 downto 0);
	signal tb : std_logic_vector(1 downto 0);
	signal ts : std_logic_vector(1 downto 0);
	signal tcarry : std_logic;
begin 

	uut : entity work.adder2 
	port map (
		ia => ta,
		ib => tb,
		os => ts,
		ocarry => tcarry
	);
	
	test : process
	begin
		ta <= "01";
		tb <= "10";
		wait for 50 ns;
		ta <= "11";
		tb <= "01";
		wait for 50 ns;
		wait;
	end process test;		

end architecture tb;
