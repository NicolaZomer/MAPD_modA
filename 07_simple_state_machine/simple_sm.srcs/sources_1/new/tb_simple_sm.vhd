library ieee;
use ieee.std_logic_1164.all;
entity patterndetect_tb is
end entity patterndetect_tb;

architecture test of patterndetect_tb is
    signal a : std_logic;
    signal clk : std_logic :='0';
    signal rst : std_logic;
    signal y : std_logic;
begin -- architecture test
    DUT : entity work.patterndetect
        port map (
            a => a,
            clk => clk,
            rst => rst,
            y => y);
    clk <= not clk after 2 ns;
    WaveGen_Proc : process
    begin
        a <= '0';
        rst <= '1'; wait for 10 ns; wait until rising_edge(clk);
        rst <= '0'; wait for 10 ns; wait until rising_edge(clk);
        rst <= '1';
        wait until rising_edge(clk);
        a <= '0';
        wait until rising_edge(clk);
        a <= '1';
        wait until rising_edge(clk);
        a <= '0';
        wait until rising_edge(clk);
        a <= '1';
        wait for 100 ns;
        wait;
    end process WaveGen_Proc;
end architecture test;