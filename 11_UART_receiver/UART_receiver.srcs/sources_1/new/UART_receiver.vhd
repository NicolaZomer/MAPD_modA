library IEEE;
use IEEE.std_logic_1164.all; -- entity



entity UART_receiver is
    port (clk: in std_logic;
    data : in std_logic;
    busy : out std_logic;
    BAUD : inout std_logic;
    uart_out : out std_logic);
end UART_receiver;


architecture rtl of UART_receiver is

component sampler_gen is
  Port (clk_b : in std_logic;
        baud_out : out std_logic);
end component;


signal word: std_logic_vector(7 downto 0);

type state_type is (DATA_IS_VALID, ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, STSTART, STSTOP, STIDLE);
signal state : state_type := STIDLE;

signal baudrate_out: std_logic;

begin

    b: baud_gen port map(clk_b => clk, baud_out => baudrate_out);
  
    sync_proc : process(clk)
    
    begin
    
    BAUD <= baudrate_out;
    
    if (rising_edge(clk)) then
    
         case state is
                when STIDLE => 
                    if valid ='1' then 
                    state <= DATA_IS_VALID;
                    end if;
                
                when DATA_IS_VALID => 
                    busy <= '1';
                    if (BAUD = '1') then 
                    state <= STSTART;
                    word <= data;
                    end if;
                
                when STSTART => -- items regarding state STstart
                
                    if (BAUD = '1') then
                    state <= ST0;
                    end if;

                when ST0 => -- items regarding state ST0
  
                    if BAUD = '1' then
                        uart_out <= word(0);
                        state <= ST1;
                    end if;
                
                when ST1 => -- items regarding state ST1
  
                    if BAUD = '1' then
                        uart_out <= word(1);
                        state <= ST2;
                    end if;
                    
                when ST2 => -- items regarding state ST2
  
                    if BAUD = '1' then
                        uart_out <= word(2);
                        state <= ST3;
                    end if;
                    
                when ST3 => -- items regarding state ST3
  
                    if BAUD = '1' then
                        uart_out <= word(3);
                        state <= ST4;
                    end if;
                    
                when ST4 => -- items regarding state ST4
  
                    if BAUD = '1' then
                        uart_out <= word(4);
                        state <= ST5;
                    end if;
                    
                when ST5 => -- items regarding state ST5
  
                    if BAUD = '1' then
                        uart_out <= word(5);
                        state <= ST6;
                    end if;
                    
                when ST6 => -- items regarding state ST6
  
                    if BAUD = '1' then
                        uart_out <= word(6);
                        state <= ST7;
                    end if;
                    
                when ST7 => -- items regarding state ST7
  
                    if BAUD = '1' then
                        uart_out <= word(7);
                        state <= STSTOP;
                    end if;
                
                when STSTOP => -- items regarding state STstop
  
                    if BAUD = '1' then
                        busy <= '0';
                        state <= STIDLE;
                    end if;
               
         end case;
      end if;
end process;

end rtl;