library ieee;
use ieee.std_logic_1164.all;

entity sipo_register is
  port (
    D : in std_logic;
    CLK, CLR : in std_logic;
    Q : out std_logic_vector(3 downto 0)
  );
end sipo_register;

architecture bhv of sipo_register is
  signal shift_reg : std_logic_vector(3 downto 0) := "0000";
begin
  process(CLK)
  begin
    if CLR = '1' then
      shift_reg <= "0000";
    elsif rising_edge(CLK) then
      shift_reg(3 downto 1) <= shift_reg(2 downto 0);
      shift_reg(0) <= D;
    end if;
  end process;
  Q <= shift_reg;
end bhv;