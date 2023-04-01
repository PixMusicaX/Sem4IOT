library IEEE;
use IEEE.std_logic_1164.all;

entity half_subtractor is
  port (a,b: in std_logic; 
        diff,borrow: out std_logic);
end half_subtractor;

architecture dataflow of half_subtractor is
begin
  diff <= a xor b;
  borrow <= (not a) and b;
end dataflow;