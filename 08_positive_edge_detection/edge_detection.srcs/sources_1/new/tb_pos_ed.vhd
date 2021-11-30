----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2021 17:00:41
-- Design Name: 
-- Module Name: tb_pos_ed - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_pos_ed is
--  Port ( );
end tb_pos_ed;

architecture Behavioral of tb_pos_ed is

component pos_ed is
Port (
 clk : in std_logic;
 input : in std_logic;
 internal_2 : inout std_logic;
 internal_1 : inout std_logic;
 detector : out std_logic);
end component pos_ed;

signal clk: std_logic; signal input, detector: std_logic;

begin -- process positive edge detection
    
    uut: pos_ed port map (clk => clk, input => input, detector => detector);
    
    p_clk : process
    begin
        clk <='0'; wait for 5ns; clk <= '1'; wait for 5ns;
    end process;
    
    p_cmb : process
    begin
        input <= '0'; wait for 78 ns;
        input <= '1'; wait;
    end process;
      
end Behavioral;
