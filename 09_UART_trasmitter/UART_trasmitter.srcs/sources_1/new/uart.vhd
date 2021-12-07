----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2021 13:01:34
-- Design Name: 
-- Module Name: uart - Behavioral
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
use IEEE.std_logic_1164.all; -- entity
use ieee.numeric_std.all;

entity UART is
    port (clk, valid : in std_logic;
    data : in std_logic;
    busy : out std_logic;
    BAUD : inout std_logic;
    uart_out : out std_logic);
end UART;

architecture rtl of UART is

component baud_gen is
  Port (clk  : in std_logic;
        baud_out   : out std_logic);
end component;

begin 
    b: baud_gen port map(clk => clk, baud_out => BAUD);

end rtl;

architecture UART of UART is
    type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, STSTART, STSTOP, STIDLE);

signal state : state_type;

begin
    sync_proc : process(clk)
begin
    if (rising_edge(clk)) then
        if (valid = '1') then
            if BAUD='1' then
               state <= STSTART;
               busy <= '1';
            else 
               state <= STIDLE;
            end if;
         
        else
        case state is
                when STSTART => -- items regarding state ST0 Z1 <= '0'; -- Moore output

                    if (BAUD = '1') then state <= ST0;
                    end if;

                when ST0 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST1;
                    end if;    
                
                when ST1 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST2;
                    end if; 
                    
                when ST2 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST3;
                    end if;  
                    
                when ST3 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST4;
                    end if; 
                    
                when ST4 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST5;
                    end if; 
                    
                when ST5 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST6;
                    end if; 
                    
                when ST6 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST7;
                    end if; 
                    
                when ST7 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= STSTOP;
                    end if; 
                
                when STSTOP => -- items regarding state ST1
  
                    if BAUD = '1' then 
                        busy <= '0';
                        state <= STIDLE;
                    end if; 
                when others => 
                    state <= STIDLE;
         end case;
         end if;
    end if;
end process sync_proc;
end UART;

