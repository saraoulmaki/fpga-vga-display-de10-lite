library ieee;
use ieee.std_logic_1164.all;
entity GeneSync is
  port (clkG : in std_logic;
        hsync, vsync, display : out std_logic;
        X : out integer range 0 to 799;
        Y : out integer range 0 to 524;
        new_image : out std_logic);
end entity;
architecture rtl of GeneSync is
  signal h : integer range 0 to 799 := 0;
  signal v : integer range 0 to 524 := 0;
begin
  process(clkG)
  begin
    if rising_edge(clkG) then
      if h = 799 then
        h <= 0;
        if v = 524 then v <= 0; else v <= v + 1; end if;
      else h <= h + 1;
      end if;
    end if;
  end process;
  X <= h; Y <= v;
  hsync <= '0' when h >= 656 and h < 752 else '1';
  vsync <= '0' when v >= 490 and v < 492 else '1';
  display <= '1' when h < 640 and v < 480 else '0';
  new_image <= '1' when h = 0 and v = 0 else '0';
end architecture;
