library IEEE;
use IEEE.std_logic_1164.all;

entity jk_ff is
  port (j, k, clk: in std_logic;
        q: out std_logic);
end entity jk_ff;

architecture bhv of jk_ff is
  signal q_int : std_logic;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if j = '1' and k = '0' then
        q_int <= '1';
      elsif j = '0' and k = '1' then
        q_int <= '0';
      elsif j = '1' and k = '1' then
        q_int <= not q_int;
      end if;
    end if;
  end process;
  
  q <= q_int;
end bhv;