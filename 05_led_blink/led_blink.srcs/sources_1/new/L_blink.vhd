----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2021 13:50:32
-- Design Name: 
-- Module Name: L_blink - Behavioral
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



entity blink is
  Port (clk : in std_logic;
        rst : in std_logic;
        y_out: out std_logic);
end blink;

architecture rtl of blink is
signal counter : unsigned (27 downto 0);
begin
p_cnt: process(clk, rst) is
    begin
    if rst ='1' then
        counter <= (others => '0');
        
    elsif rising_edge(clk) then
        counter <= counter +1;
    end if;
end process;

y_out <= counter(26);
end rtl;
