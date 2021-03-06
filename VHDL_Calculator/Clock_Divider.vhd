library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider is
    Port (
        clk_in : in  STD_LOGIC;
--        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clock_divider;

architecture Behavioral of clock_divider is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 249999 := 0;
begin
    frequency_divider: process (clk_in) begin
--        if (reset = '1') then
--            temporal <= '0';
--            counter <= 0;
        if rising_edge(clk_in) then
            if (counter = 249999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;