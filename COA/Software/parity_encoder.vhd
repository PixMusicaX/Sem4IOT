library ieee;
use ieee.std_logic_1164.all;

entity parity_encoder is
  port (data: in std_logic_vector(3 downto 0);
        parity: out std_logic);
end parity_encoder;

architecture dataflow of parity_encoder is
  signal temp: std_logic_vector(2 downto 0);
begin
  temp(0) <= data(0) xor data(1);
  temp(1) <= temp(0) xor data(2);
  parity <= temp(1) xor data(3);
end dataflow;