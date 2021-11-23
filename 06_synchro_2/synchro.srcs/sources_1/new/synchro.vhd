library ieee; 
use ieee.std_logic_1164.all; 
entity top is 
    port ( 
        clk : in std_logic; 
        rst : in std_logic; 
        d : in std_logic; 
        internal:  inout std_logic; 
        q : out std_logic; 
        sync_out: out std_logic); 
end entity top; 
architecture rtl of top is 
begin -- architecture rtl 
    flipflop : process (clk) is 
    begin -- process flipflop 
        if rising_edge(clk) then -- rising clock edge 
            if rst = '0' then 
                q <= '0'; 
            else 
                q <= d; 
                internal <= d; 
                sync_out <= internal; 
            end if; 
        end if; 
    end process flipflop; 
end architecture rtl;