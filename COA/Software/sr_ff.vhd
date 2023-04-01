library IEEE;
use IEEE.std_logic_1164.all;

entity sr_ff is
  port (s, r, clk: in std_logic;
        q, q_bar: out std_logic);
end entity sr_ff;

architecture bhv of sr_ff is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if s='1' and r='0' then
        q <= '1';
        q_bar <= '0';
      elsif s='0' and r='1' then
        q <= '0';
        q_bar <= '1';
      end if;
    end if;
  end process;
end bhv;