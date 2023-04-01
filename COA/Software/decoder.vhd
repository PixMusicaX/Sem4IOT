library IEEE;
use IEEE.std_logic_1164.all;

entity decoder is
  port (a: in std_logic_vector(1 downto 0);
        b: out std_logic_vector(3 downto 0));
end decoder;

architecture dataflow of decoder is
begin
  b(0) <= not a(0) and not a(1);
  b(1) <= not a(0) and a(1);
  b(2) <= a(0) and not a(1);
  b(3) <= a(0) and a(1);
end dataflow;