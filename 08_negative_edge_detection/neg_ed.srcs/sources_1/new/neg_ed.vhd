----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 17:30:45
-- Design Name: 
-- Module Name: neg_ed - Behavioral
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

entity neg_ed is
port (
 clk : in std_logic;
 input : in std_logic;
 sinc_out : out std_logic;
 internal: inout std_logic;
 internal2: inout std_logic);
end entity neg_ed;

architecture rtl of neg_ed is

begin -- architecture rtl
flipflop : process (clk) is

begin -- process flipflop

if rising_edge(clk) then
 -- rising clock edge
  internal <= input;
  internal2 <= internal;
  sinc_out <= (not internal) and internal2  ;
  

 end if;

end process flipflop;


end architecture rtl;