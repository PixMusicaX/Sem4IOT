library IEEE;
use IEEE.std_logic_1164.all;

entity encoder is
  port (a: in std_logic_vector(3 downto 0);
        b: out std_logic_vector(1 downto 0));
end encoder;

architecture dataflow of encoder is
begin
  b(0) <= a(1) or a(3);
  b(1) <= a(2) or a(3);
end dataflow;