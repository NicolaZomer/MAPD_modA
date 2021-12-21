library IEEE;
use IEEE.std_logic_1164.all; -- entity

entity UART_receiver is
    port (clk: in std_logic;
    data_r : in std_logic;
    BAUD : inout std_logic;
    valid: out std_logic;
    received_data : out std_logic_vector(7 downto 0)
    );
end UART_receiver;

architecture rtl of UART_receiver is

component sampler_gen is
  Port (
    clk_s : in std_logic;
    data : in std_logic;
    enable : inout std_logic;
    PULSE : inout std_logic;
    sampler_out: out std_logic
  );
end component;

-- signal word: std_logic_vector(7 downto 0);

type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, STSTART, STSTOP, STIDLE);
signal state : state_type := STIDLE;

signal baudrate_out: std_logic;

begin

    s: sampler_gen port map(clk_s => clk,  data => data_r, sampler_out => baudrate_out);
  
    sync_proc : process(clk)
    
    begin
    
    BAUD <= baudrate_out;
    
    if (rising_edge(clk)) then
         valid <= '0';
    
         case state is
                when STIDLE => 
                    if data_r = '0' then 
                        valid <= '1';
                        state <= STSTART;
                    end if;
                
                when STSTART => -- items regarding state STstart
                    valid <= '0';
                    if (BAUD = '1') then
                        state <= ST0;
                    end if;

                when ST0 => -- items regarding state ST0
  
                    if BAUD = '1' then
                        received_data(0) <= data_r;
                        state <= ST1;
                    end if;
                
                when ST1 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        received_data(1) <= data_r;
                        state <= ST2;
                    end if;
                    
                when ST2 => -- items regarding state ST2
  
                    if BAUD = '1' then
                        received_data(2) <= data_r;
                        state <= ST3;
                    end if;
                    
                when ST3 => -- items regarding state ST3
  
                    if BAUD = '1' then
                        received_data(3) <= data_r;
                        state <= ST4;
                    end if;
                    
                when ST4 => -- items regarding state ST4
  
                    if BAUD = '1' then
                        received_data(4) <= data_r;
                        state <= ST5;
                    end if;
                    
                when ST5 => -- items regarding state ST5
  
                    if BAUD = '1' then
                        received_data(5) <= data_r;
                        state <= ST6;
                    end if;
                    
                when ST6 => -- items regarding state ST6
  
                    if BAUD = '1' then
                        received_data(6) <= data_r;
                        state <= ST7;
                    end if;
                    
                when ST7 => -- items regarding state ST7
  
                    if BAUD = '1' then
                        received_data(7) <= data_r;
                        state <= STSTOP;
                    end if;
                
                when STSTOP => -- items regarding state STstop
  
                    if BAUD = '1' then
                        state <= STIDLE;
                    end if;
               
         end case;
      end if;
end process;

end rtl;