library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
  port (
    A : in std_logic;
    Y : out std_logic
  );
end not_gate;

architecture rtl of not_gate is
begin
  Y <= not A;
end rtl;