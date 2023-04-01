library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_port_ram is
    port (
        clk : in std_logic;
        we : in std_logic;
        addr : in std_logic_vector(6 downto 0);
        di : in std_logic_vector(7 downto 0);
        do : out std_logic_vector(7 downto 0)
    );
end entity single_port_ram;

architecture rtl of single_port_ram is
    type ram_type is array (0 to 127) of std_logic_vector(7 downto 0);
    signal ram : ram_type := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram(to_integer(unsigned(addr))) <= di;
            end if;
            do <= ram(to_integer(unsigned(addr)));
        end if;
    end process;
end architecture rtl;