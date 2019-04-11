----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2019 09:22:11 AM
-- Design Name: 
-- Module Name: image_top - Behavioral
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

entity image_top is
port (clk : in std_logic;
      vga_hs, vga_vs : out std_logic;
      vga_r, vga_b : out std_logic_vector(4 downto 0);
      vga_g : out std_logic_vector(5 downto 0));
end image_top;

architecture Behavioral of image_top is

component clock_div is
port (clk : in std_logic;
      div : out std_logic);
end component;

component vga_ctrl is
port (clk : in std_logic;
      clk_en : in std_logic;
      hcount : out std_logic_vector(9 downto 0);
      vcount : out std_logic_vector(9 downto 0);
      vid : out std_logic;
      vs : out std_logic;
      hs : out std_logic);
end component;

component pixel_pusher is
port (clk, clk_en : in std_logic;
      vs, vid : in std_logic;
      pixel : in std_logic_vector(7 downto 0);
      hcount : in std_logic_vector(9 downto 0);
      R, B : out std_logic_vector(4 downto 0);
      G : out std_logic_vector(5 downto 0);
      addr : out std_logic_vector(17 downto 0));
end component;

component picture is
port (clka : in std_logic;
   addra : in std_logic_vector(17 downto 0);
   douta : out std_logic_vector(7 downto 0)); 
end component;

signal div, vid, hs, vs : std_logic;
signal pixel : std_logic_vector(7 downto 0);
signal addr : std_logic_vector(17 downto 0);
signal hcount, vcount : std_logic_vector(9 downto 0);

begin

vga_vs <= vs;

u1: clock_div port map(
clk => clk,
div => div);
        
u2: vga_ctrl port map(
clk => clk,
clk_en => div,
hcount => hcount,
vcount => vcount,
vid => vid,
vs => vs,
hs => vga_hs);
        
u3: pixel_pusher port map(
clk => clk,
clk_en => div,
vs => vs,
hcount => hcount,
R => vga_r,
G => vga_g,
B => vga_b,
addr => addr,
vid => vid,
pixel => pixel);

u4: picture port map(
clka => clk,
addra => addr,
douta => pixel);
        
end Behavioral;
