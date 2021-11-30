----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 17:34:30
-- Design Name: 
-- Module Name: all_ed - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
entity top is
    port (
        clk : in std_logic;
        rst : in std_logic;
        d : in std_logic;
        internal:  inout std_logic;
        --q : out std_logic;
        sync_out: inout std_logic;
        output: out std_logic);
end entity top;
architecture rtl of top is
begin -- architecture rtl
    both_edge_det : process (clk) is
    begin -- process flipflop
        if rising_edge(clk) then -- rising clock edge
            if rst = '0' then
                internal <= '0';
            else
                internal <= d;
                sync_out <= internal;
                output <= internal xor sync_out;
            end if;
        end if;
    end process both_edge_det;
end architecture rtl;
