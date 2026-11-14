library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity GeneRGB is
  port (X : in integer range 0 to 799;
        Y : in integer range 0 to 524;
        odatax : in std_logic_vector(9 downto 0);
        reset, new_image : in std_logic;
        R, G, B : out integer range 0 to 15);
end entity;
architecture rtl of GeneRGB is
  signal xmin : integer range 0 to 610 := 310;
begin
  process(new_image)
    variable next_x : integer;
  begin
    if rising_edge(new_image) then
      if reset = '0' then xmin <= 310;
      else
        next_x := xmin - to_integer(signed(odatax)) / 20;
        if next_x < 0 then xmin <= 0;
        elsif next_x > 610 then xmin <= 610;
        else xmin <= next_x;
        end if;
      end if;
    end if;
  end process;
  R <= 15 when X >= xmin and X < xmin + 30 and Y >= 220 and Y < 250 else 0;
  G <= 0; B <= 0;
end architecture;
