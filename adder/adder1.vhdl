library ieee;
use ieee.std_logic_1164.all;

entity adder1 is
	port (
		signal a : in std_logic;
		signal b : in std_logic;
		signal cin : in std_logic;
		signal s : out std_logic;
		signal cout : out std_logic
	);
end entity adder1;

architecture behave of adder1 is
begin
	s <= a xor b xor cin;
	cout <= (a and b) or (cin and (a xor b));
end architecture behave;
