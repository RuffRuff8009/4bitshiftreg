----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2024 08:19:43 AM
-- Design Name: 
-- Module Name: shiftreg - Behavioral
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

entity shiftreg is
Port (
        set : in STD_LOGIC;
        clear : in STD_LOGIC;
        enable : in STD_LOGIC;
        D : in STD_LOGIC;
        clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0)
);
end shiftreg;

architecture Behavioral of shiftreg is

component Dflip_flop
Port (
        set : in STD_LOGIC;
        clear : in STD_LOGIC;
        enable : in STD_LOGIC;
        D : in STD_LOGIC;
        clk : in STD_LOGIC;
        Q : out STD_LOGIC
);
end component;

signal Q_vector : STD_LOGIC_VECTOR(3 downto 0);

begin
-- Cascaded connection of flip flops
    FF0: Dflip_flop port map (
        set => set,
        clear => clear,
        enable => enable,
        D => Q_vector(3),
        clk => clk,
        Q => Q_vector(0)
    );

    FF1: Dflip_flop port map (
        set => clear,
        clear => set,
        enable => enable,
        D => Q_vector(0),
        clk => clk,
        Q => Q_vector(1)
    );

    FF2: Dflip_flop port map (
        set => clear,
        clear => set,
        enable => enable,
        D => Q_vector(1),
        clk => clk,
        Q => Q_vector(2)
    );

    FF3: Dflip_flop port map (
        set => clear,
        clear => set,
        enable => enable,
        D => Q_vector(2),
        clk => clk,
        Q => Q_vector(3)
    );
Q <= Q_vector;
end Behavioral;
