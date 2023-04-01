library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
    port (
        A, B, Sel: in std_logic_vector(1 downto 0);
        Res: out std_logic_vector(1 downto 0)
    );
end ALU;

architecture bhv of ALU is
begin
    process(A, B, Sel)
        variable A_unsigned, B_unsigned, Res_unsigned: unsigned(1 downto 0);
    begin
        A_unsigned := unsigned(A);
        B_unsigned := unsigned(B);
        case Sel is
            when "00" =>
                Res_unsigned := A_unsigned + B_unsigned;
            when "01" =>
                Res_unsigned := A_unsigned + not(B_unsigned) + 1;
            when "10" =>
                Res_unsigned := A_unsigned and B_unsigned;
            when "11" =>
                Res_unsigned := A_unsigned or B_unsigned;
            when others =>
                Res_unsigned := (others => 'X');
        end case;
        Res <= std_logic_vector(Res_unsigned);
    end process;
end bhv;