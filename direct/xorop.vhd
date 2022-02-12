----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:    19:14:07 05/05/2020 
-- Design Name: 
-- Module Name:    xorop - Behavioral 
-- Project Name: Direct Implementation
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity xorop is
    Port ( I_1 : in  STD_LOGIC_VECTOR(15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR(15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR(15 downto 0));
end xorop;

architecture Behavioral of xorop is
begin
		XOR_IDEA: process(I_1, I_2)		
		begin
				O_1 <= I_1 xor I_2;
		end process XOR_IDEA;		
end Behavioral;

