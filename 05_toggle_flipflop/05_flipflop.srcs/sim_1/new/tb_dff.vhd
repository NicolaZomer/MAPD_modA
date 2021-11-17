----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2021 17:04:38
-- Design Name: 
-- Module Name: tb_dff - Behavioral
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

entity tb_dff is 
end tb_dff;

architecture Behavioral of tb_dff is 

component dff is 
    Port (clk : in std_logic;
    rst : in std_logic;
    T : in std_logic;
    d : in std_logic;
    q : out std_logic);
end component;

signal clk, rst: std_logic; signal d, q, T: std_logic;

begin -- process flipflop
    
    uut: dff port map (clk => clk, rst => rst, T => T, d => d, q => q);
    
    p_clk : process
    begin 
        clk <='0'; wait for 5ns; clk <= '1'; wait for 5ns;
    end process;
    
    p_rst : process
    begin
        rst <= '1'; wait for 20 ns; rst <= '0'; wait for 20 ns;
    end process;
    
    p_cmb : process
    begin
        d <= '0'; wait for 10 ns; 
        d <= '1'; wait for 10 ns;  
    end process; 
    
    p_tgl : process
    begin
        T <= '0'; wait for 5 ns; 
        T <= '1'; wait for 5 ns;
    end process;
     
end Behavioral;
