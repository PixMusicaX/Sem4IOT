library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
  port (clk,rst,up: in std_logic;
        z: out std_logic_vector(3 downto 0));
end counter;

architecture behavioral of counter is
  signal zint: unsigned(3 downto 0);
begin
  z <= std_logic_vector(zint);
  process (clk,rst)
  begin
    if rst = '1' then
      zint <= "0000";
    elsif rising_edge(clk) then
      if up = '1' then
        zint <= zint + 1;
      else
        zint <= zint - 1;
      end if;
    end if;
  end process;
end behavioral;