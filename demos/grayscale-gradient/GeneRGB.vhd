library ieee;
entity GeneRGB is
  port (X : in integer range 0 to 799;
        Y : in integer range 0 to 524;
        R, G, B : out integer range 0 to 15);
end entity;
architecture rtl of GeneRGB is
  function shade(xpos : integer) return integer is
  begin
    if xpos >= 640 then return 15; end if;
    return (xpos * 15) / 639;
  end function;
begin
  R <= shade(X); G <= shade(X); B <= shade(X);
end architecture;
