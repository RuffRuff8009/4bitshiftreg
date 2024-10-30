----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2024 08:12:26 AM
-- Design Name: 
-- Module Name: Dflip_flop - Behavioral
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

entity Dflip_flop is
Port (
        set : in STD_LOGIC;
        clear : in STD_LOGIC;
        enable : in STD_LOGIC;
        D : in STD_LOGIC;
        clk : in STD_LOGIC;
        Q : out STD_LOGIC 
);
end Dflip_flop;

architecture Behavioral of Dflip_flop is
begin
    process(clk, set, clear)
    begin
        if clear = '1' then
            Q <= '0';
        elsif set = '1' then
            Q <= '1';
        elsif rising_edge(clk) then
            if enable = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end Behavioral;
