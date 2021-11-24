----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2021 12:50:40
-- Design Name: 
-- Module Name: tb_state_machine - Behavioral
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

entity tb_state_machine is
--  Port ( );
end tb_state_machine;

architecture Behavioral of tb_state_machine is

component my_fsm1 is
    port (
    TOG_EN, CLK, CLR : in std_logic;
    Z1 : out std_logic);
    
end component my_fsm1;

signal CLK , CLR : std_logic; signal TOG_EN , Z1: std_logic;

begin

 uut: my_fsm1 port map (CLK => CLK, TOG_EN => TOG_EN, CLR => CLR , Z1=>Z1 );


   p_clk : process
    begin
        CLK <='0'; wait for 5ns; CLK <= '1'; wait for 5ns;
    end process;
    
  CLR_Proc : process
    begin
     CLR <= '1'; wait for 30 ns;
     CLR <= '0'; wait for 90 ns;
     CLR <= '1'; wait;
    end process; 

  TOG_EN_Proc : process
    begin
     TOG_EN <= '0'; wait for 10 ns;
     TOG_EN <= '1'; wait for 10 ns;
     TOG_EN <= '0'; wait for 10 ns;
     TOG_EN <= '1'; wait;
    end process;

end Behavioral;