library ieee;
use ieee.std_logic_1164.all;

entity xnor_gate is
  port (
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end xnor_gate;

architecture rtl of xnor_gate is
begin
  Y <= A xnor B;
end rtl;
