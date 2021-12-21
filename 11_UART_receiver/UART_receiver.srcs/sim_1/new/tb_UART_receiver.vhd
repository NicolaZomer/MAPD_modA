library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_UART_receiver is

end tb_UART_receiver;



architecture Behavioral of tb_UART_receiver is


component UART_receiver is
    port (clk: in std_logic;
    data_r : in std_logic;
    BAUD : inout std_logic;
    valid: out std_logic;
    received_data : out std_logic_vector(7 downto 0)
    );
end component UART_receiver;

signal clk: std_logic; signal data_r: std_logic; -- input
signal valid: std_logic;
signal received_data: std_logic_vector(7 downto 0); -- output data

begin

    uut: UART_receiver port map (clk => clk, data_r => data_r , valid => valid, received_data => received_data);


       p_clk : process
    begin
        clk <= '0'; wait for 5ns;
        clk <= '1'; wait for 5ns;
    end process;
    
   
       p_valid : process
    begin
        data_r <= '1'; wait for 20 us;  
        data_r <= '0'; wait for 8.68 us; -- start
        data_r <= '1'; wait for 8.68 us; -- lsb
        data_r <= '1'; wait for 8.68 us; -- bit 1
        data_r <= '0'; wait for 8.68 us; -- bit 2
        data_r <= '0'; wait for 8.68 us; -- bit 3
        data_r <= '1'; wait for 8.68 us; -- bit 4
        data_r <= '0'; wait for 8.68 us; -- bit 5
        data_r <= '1'; wait for 8.68 us; -- bit 6
        data_r <= '1'; wait for 8.68 us; -- bit 7
        data_r <= '1'; wait for 8.68 ns; -- stop       
        data_r <= '1'; wait; 
        
    end process;
     
    

    
end architecture Behavioral;
