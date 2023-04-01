library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LOGICAL_UNIT is
    port (
        op: in std_logic_vector(2 downto 0);
        a, b: in std_logic_vector(3 downto 0);
        f: out std_logic_vector(3 downto 0);
        zero: out std_logic
    );
end LOGICAL_UNIT;

architecture bhv of LOGICAL_UNIT is
begin
    process(op, a, b)
        variable temp : std_logic_vector(3 downto 0);
    begin
        case op is
            when "000" =>
                temp := a or b;
            when "001" =>
                temp := a and b;
            when "010" =>
                temp := not a;
            when "011" =>
                temp := a nor b;
            when "100" =>
                temp := a nand b;
            when "101" =>
                temp := a xor b;
            when "110" =>
                temp := a xnor b;
            when "111" =>
                if unsigned(a) < unsigned(b) then
                    temp := (others => '1');
                else
                    temp:= (others => '0');
                end if;
            when others =>
                NULL;
        end case;
        if temp = "0000" then
            zero <= '1';
        else
            zero <= '0';
        end if;
        f <= temp;
    end process;
end bhv;
