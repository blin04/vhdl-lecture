library ieee;
use ieee.std_logic_1164.all;

entity adder8 is
	port (
		signal ia : in std_logic_vector(7 downto 0);
		signal ib : in std_logic_vector(7 downto 0);
		signal os : out std_logic_vector(7 downto 0);
		signal ocarry : out std_logic
	);
end entity adder8;

architecture behave of adder8 is
	signal oc : std_logic_vector (7 downto 0);

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

	u2 : entity work.adder1
	port map (
		a => ia(2),
		b => ib(2),
		cin => oc(1),
		s => os(2),
		cout => oc(2)
	);

	u3 : entity work.adder1
	port map (
		a => ia(3),
		b => ib(3),
		cin => oc(2),
		s => os(3),
		cout => oc(3)
	);

	u4 : entity work.adder1
	port map (
		a => ia(4),
		b => ib(4),
		cin => oc(3),
		s => os(4),
		cout => oc(4)
	);

	u5 : entity work.adder1
	port map (
		a => ia(5),
		b => ib(5),
		cin => oc(4),
		s => os(5),
		cout => oc(5)
	);

	u6 : entity work.adder1
	port map (
		a => ia(6),
		b => ib(6),
		cin => oc(5),
		s => os(6),
		cout => oc(6)
	);

	u7 : entity work.adder1
	port map (
		a => ia(7),
		b => ib(7),
		cin => oc(6),
		s => os(7),
		cout => oc(7)
	);

	ocarry <= oc(7);

end architecture behave;
