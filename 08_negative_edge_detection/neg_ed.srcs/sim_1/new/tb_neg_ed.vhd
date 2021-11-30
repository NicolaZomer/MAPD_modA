----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 17:31:25
-- Design Name: 
-- Module Name: tb_neg_ed - Behavioral
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


entity tb_neg_ed is
--  Port ( );
end tb_neg_ed;

architecture Behavioral of tb_neg_ed is

component neg_ed is
Port (
 clk : in std_logic;
 input : in std_logic;
 sinc_out : out std_logic;
 internal : inout std_logic;
 internal2 : inout std_logic);
end component neg_ed;

signal clk: std_logic; signal input, sinc_out: std_logic;

begin -- process flipflop
    
    uut: neg_ed port map (clk => clk, input => input, sinc_out => sinc_out );
    
    p_clk : process
    begin
        clk <='0'; wait for 5ns; clk <= '1'; wait for 5ns;
    end process;
    
    p_cmb : process
    begin
        input <= '0'; wait for 80 ns;
        input <= '1'; wait for 48 ns;
        input <= '0'; wait;
    end process;
      
end Behavioral;
