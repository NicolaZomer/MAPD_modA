
library IEEE;
use IEEE.std_logic_1164.all; -- entity

entity sampler_gen is
    port (clk : in std_logic;
    data : in std_logic;
    enable : inout std_logic;
    PULSE : inout std_logic;
    sampler_out: out std_logic);
end sampler_gen;

architecture rtl of sampler_gen is

component pulse_gen is
  Port (clk_p : in std_logic;
        enable_p : inout std_logic;
        pulse_out : out std_logic);
end component;

component delay_line is
    port(
        clk_d : in std_logic;
        pulse_out: inout std_logic;
        shift : out std_logic
    );
end component;

type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, STSTART, STSTOP, STIDLE);
signal state : state_type := STIDLE;

signal PULSE_out: std_logic;

begin

    p: pulse_gen port map(clk_p => clk, pulse_out => PULSE_out, enable_p => enable);
    d: delay_line port map(clk_d => clk, shift => sampler_out);
  
    sync_proc : process(clk)
    
    begin
    
    PULSE <= PULSE_out;
    
    if (rising_edge(clk)) then
         case state is
                when STIDLE => 
                    if data = '0' then 
                        enable <= '1';
                        state <= STSTART;
                    end if;
                
                
                when STSTART => -- items regarding state STstart
                
                    if (PULSE = '1') then
                    state <= ST0;
                    end if;

                when ST0 => -- items regarding state ST0
  
                    if PULSE = '1' then
                        state <= ST1;
                    end if;
                
                when ST1 => -- items regarding state ST1
  
                    if PULSE = '1' then
                        state <= ST2;
                    end if;
                    
                when ST2 => -- items regarding state ST2
  
                    if PULSE = '1' then
                        state <= ST3;
                    end if;
                    
                when ST3 => -- items regarding state ST3
  
                    if PULSE = '1' then
                        state <= ST4;
                    end if;
                    
                when ST4 => -- items regarding state ST4
  
                    if PULSE = '1' then
                        state <= ST5;
                    end if;
                    
                when ST5 => -- items regarding state ST5
  
                    if PULSE = '1' then
                        state <= ST6;
                    end if;
                    
                when ST6 => -- items regarding state ST6
  
                    if PULSE = '1' then
                        state <= ST7;
                    end if;
                    
                when ST7 => -- items regarding state ST7
  
                    if PULSE = '1' then
                        state <= STSTOP;
                    end if;
                
                when STSTOP => -- items regarding state STstop
  
                    if PULSE = '1' then
                        enable <= '0';
                        state <= STIDLE;
                    end if;
               
         end case;
      end if;
end process;

end rtl;