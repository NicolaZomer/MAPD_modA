----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2021 13:50:51
-- Design Name: 
-- Module Name: delay_line - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity delay_line is
    port(
        clk_d : in std_logic;
        pulse_in: in std_logic;
        shift : out std_logic
    );
end delay_line;

architecture Behavioral of delay_line is

-- component pulse_gen is
--   Port (clk_p : in std_logic;
--         enable_p : inout std_logic;
--         pulse_out : out std_logic);
-- end component;

begin
    -- p: pulse_gen port map(clk_p => clk_d, pulse_out => pulse_out);
    
    shift_count : process (clk_d) is
        variable cnt : INTEGER RANGE 0 to 1023 := 435 ;
    begin -- process shift count
 
    if rising_edge(clk_d) then
    -- rising clock edge
        cnt := cnt+1;
        if pulse_in = '1' then 
            cnt := 0;
        end if;
        
        if cnt = 434 then
            shift <= '1';
        else
            shift <= '0';
        end if;
       
    end if;
    
end process shift_count;
end Behavioral;
