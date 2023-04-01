library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity comparator is
  port (a,b: in std_logic_vector(3 downto 0);
        greater,equal,less: out std_logic);
end comparator;

architecture behavioral of comparator is
begin
  process (a,b)
  begin
    if (a > b) then
      greater <= '1';
      equal <= '0';
      less <= '0';
    elsif (a = b) then
      greater <= '0';
      equal <= '1';
      less <= '0';
    else
      greater <= '0';
      equal <= '0';
      less <= '1';
    end if;
  end process;
end behavioral;