library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity upcounter is
  port (clk,rst: in std_logic;
        z: out std_logic_vector(2 downto 0));
end upcounter;

architecture behavioral of upcounter is
  signal zint: unsigned(2 downto 0);
begin
  z <= std_logic_vector(zint);
  process (clk,rst)
  begin
    if rst = '1' then
      zint <= "000";
    elsif clk'event and clk = '1' then
      zint <= zint + 1;
    end if;
  end process;
end behavioral;