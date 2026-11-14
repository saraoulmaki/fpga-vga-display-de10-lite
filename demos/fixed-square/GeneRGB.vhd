library ieee;
entity GeneRGB is
  port (X : in integer range 0 to 799;
        Y : in integer range 0 to 524;
        R, G, B : out integer range 0 to 15);
end entity;
architecture rtl of GeneRGB is
begin
  R <= 15 when X >= 310 and X < 340 and Y >= 220 and Y < 250 else 0;
  G <= 0; B <= 0;
end architecture;
