library ieee;
use ieee.std_logic_1164.all;

entity demux1to4 is
    port (
        sel : in std_logic_vector(1 downto 0);
        x : in std_logic;
        y : out std_logic_vector(3 downto 0)
    );
end demux1to4;

architecture bhv of demux1to4 is
begin
    process (sel, x)
    begin
        if sel = "00" then
            y <= (x, '0', '0', '0');
        elsif sel = "01" then
            y <= ('0', x, '0', '0');
        elsif sel = "10" then
            y <= ('0', '0', x, '0');
        elsif sel = "11" then
            y <= ('0', '0', '0', x);
        else
            y <= (others => 'X');
        end if;
    end process;
end bhv;