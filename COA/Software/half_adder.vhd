library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
  port (a,b: in std_logic; 
        sum,carry: out std_logic);
end half_adder;

architecture dataflow of half_adder is
begin
  sum <= a xor b;
  carry <= a and b;
end dataflow;