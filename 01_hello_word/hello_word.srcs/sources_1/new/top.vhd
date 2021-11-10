----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2021 13:14:15
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
port (btn_in : in std_logic_vector(1 downto 0);
led_out1 : out std_logic;
led_out2 : out std_logic);
end top;
architecture Behavioral of top is
begin
led_out1 <= btn_in(0)xor btn_in(1);
led_out2 <= btn_in(0);
end Behavioral;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- entity top is
--  Port ( );
-- end top;

-- architecture Behavioral of top is

-- begin


-- end Behavioral;
