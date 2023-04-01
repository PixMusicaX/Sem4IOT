library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
  port (
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end xor_gate;

architecture rtl of xor_gate is
begin
  Y <= A xor B;
end rtl;