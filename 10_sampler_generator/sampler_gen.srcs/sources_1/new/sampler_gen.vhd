
library IEEE;
use IEEE.std_logic_1164.all; -- entity

entity sampler_gen is
    port (clk, valid : in std_logic;
    data : in std_logic;
    busy : out std_logic;
    BAUD : inout std_logic;
    uart_out : out std_logic);
end sampler_gen;


architecture rtl of sampler_gen is

component pulse_gen is
  Port (clk_b : in std_logic;
        pulse_out : out std_logic);
end component;



type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, STSTART, STSTOP, STIDLE);
signal state : state_type;

signal baudrate_out: std_logic;

begin

    b: baud_gen port map(clk_b => clk, baud_out => baudrate_out);
  
    sync_proc : process(clk)
    
    begin
    
    BAUD <= baudrate_out;
    
    if (rising_edge(clk)) then
        if (valid = '1') then
            if BAUD ='1' then
               state <= STSTART;
               busy <= '1';
            else
               state <= STIDLE;
            end if;
         
        else
        case state is
                when STSTART => -- items regarding state STstart
                
                    if (BAUD = '1') then state <= ST0;
                    end if;

                when ST0 => -- items regarding state ST0
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST1;
                    end if;
                
                when ST1 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST2;
                    end if;
                    
                when ST2 => -- items regarding state ST2
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST3;
                    end if;
                    
                when ST3 => -- items regarding state ST3
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST4;
                    end if;
                    
                when ST4 => -- items regarding state ST4
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST5;
                    end if;
                    
                when ST5 => -- items regarding state ST5
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST6;
                    end if;
                    
                when ST6 => -- items regarding state ST6
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= ST7;
                    end if;
                    
                when ST7 => -- items regarding state ST7
  
                    if BAUD = '1' then
                        uart_out <= data;
                        state <= STSTOP;
                    end if;
                
                when STSTOP => -- items regarding state STstop
  
                    if BAUD = '1' then
                        busy <= '0';
                        state <= STIDLE;
                    end if;
                when others =>
                    state <= STIDLE;
         end case;
         end if;
    end if;
end process;

end rtl;