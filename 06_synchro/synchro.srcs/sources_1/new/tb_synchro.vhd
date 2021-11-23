----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2021 16:51:03
-- Design Name: 
-- Module Name: tb_synchro - Behavioral
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


entity tb_synchro is
--  Port ( );
end tb_synchro;

architecture Behavioral of tb_synchro is

component synchro is
Port (
 clk : in std_logic;
 input : in std_logic;
 sinc_out : out std_logic;
 internal : inout std_logic);
end component synchro;

signal clk: std_logic; signal input, sinc_out, internal: std_logic;

begin -- process flipflop
    
    uut: synchro port map (clk => clk, input => input, sinc_out => sinc_out , internal=> internal );
    
    p_clk : process
    begin
        clk <='0'; wait for 5ns; clk <= '1'; wait for 5ns;
    end process;
    
    p_cmb : process
    begin
        input <= '0'; wait for 33 ns;
        input <= '1'; wait for 40 ns;
        input <= '0'; wait for 20 ns;
        input <= '1'; wait for 4 ns;
        input <= '0'; wait for 4 ns;
        input <= '1'; wait for 2 ns;
        input <= '0'; wait for 10 ns; wait ;
    end process;
      
end Behavioral;
