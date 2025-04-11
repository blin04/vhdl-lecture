library ieee;
use ieee.std_logic_1164.all;

entity adder2 is
	port (
		signal ia : in std_logic_vector(1 downto 0);
		signal ib : in std_logic_vector(1 downto 0);
		signal os : out std_logic_vector(1 downto 0);
		signal ocarry : out std_logic
	);
end entity adder2;

architecture structural of adder2 is
	signal oc : std_logic_vector (1 downto 0);

	component adder1
	port (
		signal a : in std_logic;
		signal b : in std_logic;
		signal cin : in std_logic;
		signal s : out std_logic;
		signal cout : out std_logic
	);
	end component adder1;

begin

	u0 : entity work.adder1 
	port map (
		a => ia(0),
		b => ib(0),
		cin => '0',
		s => os(0),
		cout => oc(0)
	);

	u1 : entity work.adder1
	port map (
		a => ia(1),
		b => ib(1),
		cin => oc(0),
		s => os(1),
		cout => oc(1)
	);

end architecture structural;
