library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulse_gen is
  Port ( clk_p : in std_logic;
         pulse_out : out std_logic;
         enable_p: inout std_logic);
end entity pulse_gen;

architecture rtl of pulse_gen is

begin
 baudgen : process (clk_p) is
    variable cnt : INTEGER RANGE 0 to 1023 := 0 ;
begin -- process baudge
 
if rising_edge(clk_p) then
 -- rising clock edge
    if enable_p = '1' then
        if cnt = 867 then
            pulse_out <= '1';
            cnt := 0;
        else
            pulse_out <= '0';
            cnt := cnt +1 ;
        end if;
    end if;
end if;

end process baudgen;

end architecture rtl;