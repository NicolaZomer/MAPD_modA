----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2021 13:53:10
-- Design Name: 
-- Module Name: slw_cnt - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
entity cnt is
    port (
        clk: in std_logic;
        rst: in std_logic;
        y_out: out std_logic_vector(3 downto 0)        
    );
end cnt;

architecture rtl of cnt is
    signal slow_clk, slow_clk_p: std_logic; signal counter : unsigned (27 downto 0);
    signal slow_counter : unsigned (3 downto 0);
    begin
        p_cnt: process(clk, rst) is 
        begin 
        if rst = '1' then 
            counter <= (others => '0');
        elsif rising_edge(clk) then 
            counter <= counter +1;
        end if;
    end process;

    slow_clk_p <= counter(26);
    p_slw_cnt: process(clk, rst, slow_clk) is 
    begin
        if rst = '1' then
            slow_counter <= (others => '0');
        elsif rising_edge(clk) then 
            slow_clk_p <= slow_clk;
            if slow_clk = '1' and slow_clk_p = '0' then -- "RISING EDGE"
                slow_counter <= slow_counter +1;
            end if; 
        end if;    
    end process;
    
    y_out <= std_logic_vector(slow_counter);
end rtl;
                





