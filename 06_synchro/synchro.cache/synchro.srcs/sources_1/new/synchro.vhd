library ieee;
use ieee.std_logic_1164.all;

entity synchro is
port (
 clk : in std_logic;
 d : in std_logic;
 q : out std_logic);
end entity synchro;

architecture rtl of synchro is

signal n1: std_logic;

begin -- architecture rtl
flipflop : process (clk) is

begin -- process flipflop

if rising_edge(clk) then
 -- rising clock edge
  n1 <= d;
  q <= n1;
  

 end if;

end process flipflop;


end architecture rtl;