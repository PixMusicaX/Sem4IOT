library ieee;
use ieee.std_logic_1164.all;

entity pipo_register is
  port (
    D : in std_logic_vector(3 downto 0);
    CLK, CLR : in std_logic;
    Q : out std_logic_vector(3 downto 0)
  );
end pipo_register;

architecture bhv of pipo_register is
  signal shift_reg : std_logic_vector(3 downto 0) := "0000";
begin
  process(CLK)
  begin
    if CLR = '1' then
      shift_reg <= "0000";
    elsif rising_edge(CLK) then
      shift_reg <= D;
    end if;
  end process;
  
  Q <= shift_reg;
end bhv;