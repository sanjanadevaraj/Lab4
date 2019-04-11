----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2019 12:56:38 AM
-- Design Name: 
-- Module Name: vga_ctrl_tb - Behavioral
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

entity vga_ctrl_tb is
end vga_ctrl_tb;

architecture Behavioral of vga_ctrl_tb is
signal clk, clk_en, vs, hs, vid : std_logic :='0';
signal hcount, vcount : std_logic_vector(9 downto 0) := "0000000000";

component vga_ctrl port (clk : in std_logic;
clk_en : in std_logic;
hcount : out std_logic_vector(9 downto 0);
vcount : out std_logic_vector(9 downto 0);
vid : out std_logic;
vs : out std_logic;
hs : out std_logic);
end component;

begin
clk_test: process begin
clk <= '1';
wait for 2 ns;
clk <= '0';
wait for 2 ns;
end process;

clk_en_test: process begin
clk_en <= '1';
wait for 2 ns;
clk_en <= '0';
wait for 2 ns;
end process;

vga_ctrl_test: vga_ctrl port map(
clk => clk,
clk_en => clk_en,
hcount => hcount,
vcount=> vcount,
hs => hs,
vs => vs,
vid => vid);
    
end Behavioral;