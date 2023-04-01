library ieee;
use ieee.std_logic_1164.all;

entity siso_register is
  port (
    Q : in std_logic;
    CLK, CLR : in std_logic;
    Q_out : out std_logic;
    d : inout std_logic_vector(3 downto 0)
  );
end siso_register;

architecture bhv of siso_register is
begin
  process(CLK)
  begin
    if CLR = '1' then
      d <= "0000";
      Q_out <= '0';
    elsif rising_edge(CLK) then
      d(3 downto 1) <= d(2 downto 0);
      d(0) <= Q;
      Q_out <= d(3);
    end if;
  end process;
  end bhv;