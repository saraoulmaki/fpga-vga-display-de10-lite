library ieee;
use ieee.std_logic_1164.all;
entity FreqDiv is
  port (clk : in std_logic; clk_slow : out std_logic);
end entity;
architecture rtl of FreqDiv is
  signal divided : std_logic := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then divided <= not divided; end if;
  end process;
  clk_slow <= divided;
end architecture;
