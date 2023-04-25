library IEEE;
use IEEE.std_logic_1164.all;

entity full_subtractor is
  port (
    a,b,c: in std_logic; 
    sub,borrow: out std_logic
  );
end full_subtractor;

architecture dataflow of full_subtractor is
begin
  sub <= a xor b xor c;
  borrow <= ((b xor c) and (not a)) or (b and c);
end dataflow;
