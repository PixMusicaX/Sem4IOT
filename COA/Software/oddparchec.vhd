library ieee;
use ieee.std_logic_1164.all;

entity oddparchec is
  port (a0,a1,a2,a3 : in std_logic;
        p : out std_logic);
end oddparchec;

architecture bhv of oddparchec is
begin
  p <= not (((a0 xor a1) xor a2) xor a3);
end bhv;