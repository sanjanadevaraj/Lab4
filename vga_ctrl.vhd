----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2019 09:21:09 AM
-- Design Name: 
-- Module Name: vga_ctrl - Behavioral
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

entity vga_ctrl is
port (clk, clk_en : in std_logic;
      hcount, vcount : out std_logic_vector (9 downto 0);
      vid, hs, vs : out std_logic);
end vga_ctrl;

architecture Behavioral of vga_ctrl is
signal hcount_i, vcount_i: std_logic_vector (9 downto 0) := "0000000000";

begin

process(clk)
begin
if (rising_edge(clk)) then                                                              
   if (clk_en = '1') then                 
       if (unsigned(vcount_i) <524) then
           if (unsigned(hcount_i) < 799) then
               hcount_i <= std_logic_vector(unsigned(hcount_i) + 1 );
           else
              vcount_i <= std_logic_vector(unsigned(vcount_i) + 1 );
              hcount_i <= (others => '0');
           end if;
       else 
            vcount_i <= (others => '0');
       end if;
               
   if (unsigned(hcount_i) <= 639 and unsigned(vcount_i) <= 479) then 
      vid <= '1';                                                                 
   else                                                                           
      vid <= '0';                                                                 
   end if;
         
   if (unsigned(hcount_i) >= 656 and unsigned(hcount_i) <= 751) then
       hs <= '0';                                                                
   else                                                                          
       hs <= '1';                                                                 
   end if;
                 
   if (unsigned(vcount_i) >= 490 and unsigned(vcount_i) <= 491) then
       vs <= '0';                                                                  
   else                                                                            
       vs <= '1';                                                                  
   end if;
 hcount <= hcount_i;
 vcount <= vcount_i;   
end if;
end if;
end process;
end Behavioral;