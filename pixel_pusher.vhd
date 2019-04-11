----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2019 09:21:56 AM
-- Design Name: 
-- Module Name: pixel_pusher - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity pixel_pusher is
port (clk : in std_logic;
      clk_en : in std_logic;
      vs, vid : in std_logic;
      pixel : in std_logic_vector(7 downto 0);
      hcount : in std_logic_vector (9 downto 0);
      R, B : out std_logic_vector (4 downto 0);
      G : out std_logic_vector (5 downto 0);
      addr : out std_logic_vector (17 downto 0));
end pixel_pusher;

architecture Behavioral of pixel_pusher is
signal addr_i : std_logic_vector(17 downto 0);

begin

process (clk) 
begin
 if (rising_edge(clk)) then
     if(clk_en = '1') then
       if vid = '1' and (unsigned(hcount)) < 480 then
           addr_i <= std_logic_vector(unsigned(addr_i) + 1);
         elsif vs = '0' then
           addr_i <= (others => '0');
         end if;
       if (vid = '1' and unsigned(hcount) < 480) then
         R <= pixel(7 downto 5) & "00";
         G <= pixel(4 downto 2) & "000";
         B <= pixel(1 downto 0) & "000";
       else
         R <= (others => '0');
         G <= (others => '0');
         B <= (others => '0');
       end if;
    end if;
end if;
addr <= addr_i;
end process;
end Behavioral;
