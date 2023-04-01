library ieee;
use ieee.std_logic_1164.all;

entity evenpargen is
  port (a0,a1,a2,a3 : in std_logic;
        p : out std_logic);
end evenpargen;

architecture bhv of evenpargen is
begin
  p <= (((a0 xor a1) xor a2) xor a3);
end bhv;