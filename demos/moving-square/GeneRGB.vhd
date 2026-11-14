library ieee;
use ieee.std_logic_1164.all;
entity GeneRGB is
  port (X : in integer range 0 to 799;
        Y : in integer range 0 to 524;
        reset, sens, new_image : in std_logic;
        R, G, B : out integer range 0 to 15);
end entity;
architecture rtl of GeneRGB is
  signal xmin : integer range 0 to 610 := 310;
begin
  process(new_image)
  begin
    if rising_edge(new_image) then
      if reset = '0' then xmin <= 310;
      elsif sens = '1' and xmin < 610 then xmin <= xmin + 1;
      elsif sens = '0' and xmin > 0 then xmin <= xmin - 1;
      end if;
    end if;
  end process;
  R <= 15 when X >= xmin and X < xmin + 30 and Y >= 220 and Y < 250 else 0;
  G <= 0; B <= 0;
end architecture;
