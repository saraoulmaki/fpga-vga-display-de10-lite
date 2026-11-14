library ieee;
use ieee.std_logic_1164.all;
entity VGA_Colors is
  port (clk, red, green, blue : in std_logic;
        hsync, vsync, R, G, B : out std_logic);
end entity;
architecture rtl of VGA_Colors is
  signal pixel_clk, active_video, frame_start : std_logic;
  signal xpos : integer range 0 to 799;
  signal ypos : integer range 0 to 524;
begin
  divider : entity work.FreqDiv port map (clk, pixel_clk);
  sync : entity work.GeneSync
    port map (pixel_clk, hsync, vsync, active_video, xpos, ypos, frame_start);
  R <= red and active_video;
  G <= green and active_video;
  B <= blue and active_video;
end architecture;
