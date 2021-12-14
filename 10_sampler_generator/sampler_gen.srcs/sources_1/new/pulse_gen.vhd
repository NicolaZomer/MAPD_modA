library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity baud_gen is
  Port ( clk_b : in std_logic;
         baud_out : out std_logic);
end entity baud_gen;

architecture rtl of baud_gen is

begin
 baudgen : process (clk_b) is
    variable cnt : INTEGER RANGE 0 to 1023 := 0 ;
begin -- process baudge
 
if rising_edge(clk_b) then
 -- rising clock edge
    if cnt = 867 then
        baud_out <= '1';
        cnt := 0;
    else
        baud_out <= '0';
        cnt := cnt +1 ;
        
    end if;
end if;

end process baudgen;

end architecture rtl;