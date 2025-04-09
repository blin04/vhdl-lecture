library ieee;
use ieee.std_logic_1164.all;

entity adder8_tb is
end entity adder8_tb;

architecture tb of adder8_tb is
	signal ta : std_logic_vector(7 downto 0);
	signal tb : std_logic_vector(7 downto 0);
	signal ts : std_logic_vector(7 downto 0);
	signal tcarry : std_logic;
begin 

	uut : entity work.adder8 
	port map (
		ia => ta,
		ib => tb,
		os => ts,
		ocarry => tcarry
	);
	
	test : process
	begin
		ta <= "00000101";
		tb <= "00001010";
		wait for 50 ns;
		ta <= "10001011";
		tb <= "00100001";
		wait for 50 ns;
		ta <= "10000000";
		tb <= "10000000";
		wait for 50 ns;
		wait;
	end process test;		

end architecture tb;
