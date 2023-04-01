library IEEE;
use IEEE.std_logic_1164.all;

entity t_ff is
  port (t, clk: in std_logic;
        q: out std_logic);
end entity t_ff;

architecture bhv of t_ff is
  signal q_int : std_logic;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if t = '1' then
        q_int <= not q_int;
      end if;
    end if;
  end process;
  
  q <= q_int;
end bhv;