library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
    port (
        sel : in std_logic;
        a, b : in std_logic;
        y : out std_logic
    );
end mux2to1;

architecture bhv of mux2to1 is
begin
    process (sel, a, b)
    begin
        if sel = '0' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end bhv;