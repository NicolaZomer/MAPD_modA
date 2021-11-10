----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2021 12:55:57
-- Design Name: 
-- Module Name: top - Behavioral
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


entity mux21 is
  Port (a_in    : in std_logic;
        b_in    : in std_logic;
        sel_in  : in std_logic;
        y_out   : out std_logic);
end mux21;

architecture rtl of mux21 is

begin

process (a_in, b_in, sel_in) is
begin
    if sel_in = '0' then
        y_out <= a_in;
    else
        y_out <= b_in;
    end if;
end process;


end rtl;
