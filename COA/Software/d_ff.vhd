library IEEE;
use IEEE.std_logic_1164.all;

entity d_ff is
  port (d, clk: in std_logic;
        q: out std_logic);
end entity d_ff;

architecture bhv of d_ff is
  signal q_int : std_logic;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      q_int <= d;
    end if;
  end process;
  
  q <= q_int;
end bhv;