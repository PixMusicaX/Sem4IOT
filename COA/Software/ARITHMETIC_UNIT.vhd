library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ARITHMETIC_UNIT is
    port (
        op: in std_logic_vector(2 downto 0);
        a, b: in std_logic_vector(3 downto 0);
        f: out std_logic_vector(3 downto 0)
    );
end ARITHMETIC_UNIT;

architecture bhv of ARITHMETIC_UNIT is
begin
    process(op, a, b)
        variable temp : unsigned(3 downto 0);
    begin
        case op is
            when "000" =>
                temp := unsigned(a) + unsigned(b);
            when "001" =>
                temp := unsigned(a) + unsigned(b) + 1;
            when "010" =>
                temp := unsigned(a) + not unsigned(b) + 1;
            when "011" =>
                temp := unsigned(a) + not unsigned(b);
            when "100" =>
                temp := unsigned(a) + 1;
            when "101" =>
                temp := unsigned(a) - 1;
            when "110" =>
                temp := unsigned(a);
            when "111" =>
                temp := unsigned(b);
            when others =>
                NULL;
        end case;
        f <= std_logic_vector(temp);
    end process;
end bhv;                     