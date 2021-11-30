----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 17:00:41
-- Design Name: 
-- Module Name: pos_ed - Behavioral
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

entity pos_ed is
port (
 clk : in std_logic;
 input : in std_logic;
 internal_2 : inout std_logic;
 internal_1: inout std_logic;
 detector: out std_logic);
end entity pos_ed;

architecture rtl of pos_ed is

begin -- architecture rtl
pos_edge_detection : process (clk) is

begin -- process flipflop

if rising_edge(clk) then
 -- rising clock edges
  internal_1 <= input;
  internal_2 <= internal_1;
  detector <= internal_1 and (not internal_2);
  
 end if;

end process pos_edge_detection;


end architecture rtl;
