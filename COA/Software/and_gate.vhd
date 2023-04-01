library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
  port (
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end and_gate;

architecture rtl of and_gate is
begin
  Y <= A and B;
end rtl;