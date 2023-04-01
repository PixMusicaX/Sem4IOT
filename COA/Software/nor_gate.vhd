library ieee;
use ieee.std_logic_1164.all;

entity nor_gate is
  port (
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic
  );
end nor_gate;

architecture rtl of nor_gate is
begin
  Y <= A nor B;
end rtl;