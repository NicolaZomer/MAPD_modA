----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 17:35:35
-- Design Name: 
-- Module Name: tb_all_ed - Behavioral
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

entity tb_top is

end tb_top;


architecture Behavioral of tb_top is

component top is
    port (
        clk : in std_logic;
        rst : in std_logic;
        d : in std_logic;
        internal:  inout std_logic;
        --q : out std_logic;
        sync_out: inout std_logic;
        output: out std_logic);
end component;

signal clk,rst : std_logic; signal d: std_logic; signal output: std_logic; 

begin 

uut: top port map (clk=> clk, rst=> rst, d=> d, output=>output);

p_clk: process
begin 
    clk<='0'; wait for 5 ns; clk<='1'; wait for 5 ns; 
end process;
    
p_rst: process
begin 
    rst<='1'; wait;-- for 15 ns; rst<='0'; wait for 15ns;
 end process;
 
 p_d: process
 begin
    d<= '0'; wait for 43 ns;
    d<= '1'; wait for 43 ns;
 end process;
 
 end Behavioral;