library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_uart is

end tb_uart;



architecture Behavioral of tb_uart is


component UART is
    Port (clk , valid: in std_logic;
    data : in std_logic_vector(7 downto 0);
    busy : out std_logic;
    BAUD : inout std_logic;
    uart_out : out std_logic);
end component UART;


signal clk: std_logic; signal valid, busy, uart_out: std_logic;
signal data: std_logic_vector(7 downto 0) := "01100001";

begin

    uut: UART port map (clk => clk, valid => valid, data => data , busy => busy, uart_out => uart_out);


       p_clk : process
    begin
        clk <= '0'; wait for 5ns;
        clk <= '1'; wait for 5ns;
    end process;
    
   
       p_valid : process
    begin
        valid <= '0'; wait for 40 ns;        
        valid <= '1'; wait for 10 ns;        
        valid <= '0'; wait;        

    end process;
     
    

    
end architecture Behavioral;
