library ieee;
use ieee.std_logic_1164.all;

entity synchro is
port (
 clk : in std_logic;
 input : in std_logic;
 sinc_out : out std_logic;
 internal: inout std_logic);
end entity synchro;

architecture rtl of synchro is

begin -- architecture rtl
flipflop : process (clk) is

begin -- process flipflop

if rising_edge(clk) then
 -- rising clock edge
  internal <= input;
  sinc_out <= internal;
  

 end if;

end process flipflop;


end architecture rtl;