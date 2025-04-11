library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder2int is
    port (
        signal ia : in integer;
		signal ib : in integer;    
		signal os : out integer  
    );
end entity adder2int;

architecture behavioral of adder2int is
begin
    os <= ia + ib;
end architecture behavioral;