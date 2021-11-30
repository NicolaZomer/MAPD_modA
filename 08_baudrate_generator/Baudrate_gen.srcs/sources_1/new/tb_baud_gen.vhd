----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 17:37:06
-- Design Name: 
-- Module Name: baud_gen - Behavioral
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

entity tb_baud_gen is

end entity tb_baud_gen;

architecture Behavioral of tb_baud_gen is

component baud_gen is
  Port ( clk : in std_logic;
         baud_out : out std_logic);
end component baud_gen;


signal clk: std_logic; signal baud_out: std_logic;

begin -- process baudgen
    
    uut: baud_gen port map (clk => clk, baud_out => baud_out );
    
    p_clk : process
    begin
        clk <='0'; wait for 0.1ns; clk <= '1'; wait for 0.1ns;
    end process;



end architecture Behavioral;
