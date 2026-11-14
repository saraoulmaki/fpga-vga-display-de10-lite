library ieee;
use ieee.std_logic_1164.all;
entity VGA_Static is
  port (clk : in std_logic;
        hsync, vsync : out std_logic;
        R, G, B : out integer range 0 to 15);
end entity;
architecture rtl of VGA_Static is
  signal pixel_clk, active_video, frame_start : std_logic;
  signal xpos : integer range 0 to 799;
  signal ypos : integer range 0 to 524;
  signal red_pixel, green_pixel, blue_pixel : integer range 0 to 15;
begin
  divider : entity work.FreqDiv port map (clk, pixel_clk);
  sync : entity work.GeneSync
    port map (pixel_clk, hsync, vsync, active_video, xpos, ypos, frame_start);
  rgb : entity work.GeneRGB
    port map (xpos, ypos, red_pixel, green_pixel, blue_pixel);
  R <= red_pixel when active_video = '1' else 0;
  G <= green_pixel when active_video = '1' else 0;
  B <= blue_pixel when active_video = '1' else 0;
end architecture;
