----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    mulop - Behavioral 
-- Project Name: 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is	
signal TEMP_I1: STD_LOGIC_VECTOR(16 downto 0);
signal TEMP_I2: STD_LOGIC_VECTOR(16 downto 0);
signal PROD: STD_LOGIC_VECTOR(33 downto 0);
signal DIFF: STD_LOGIC_VECTOR(16 downto 0);
signal HIGH: STD_LOGIC_VECTOR(16 downto 0); --Quotient
signal LOW: STD_LOGIC_VECTOR(15 downto 0); --Modular (Remainder)

begin
				
		MUL_IDEA_ZERO_CHECK: process(I_1, I_2)						
				begin
					TEMP_I1 <= '0' & I_1;
					TEMP_I2 <= '0' & I_2;
					if (I_1 = x"0000") then
						TEMP_I1 <= ('1' & x"0000");
					end if;
					if (I_2 = x"0000") then
						TEMP_I2 <= ('1' & x"0000");
					end if; 				
				end process MUL_IDEA_ZERO_CHECK;	
				
				PROD <= TEMP_I1 * TEMP_I2;
				HIGH  <= PROD(32 downto 16);
				LOW  <= PROD(15 downto 0);
		
		MUL_IDEA: process(HIGH, LOW)						
				begin
					if (LOW >= HIGH) then
						DIFF <= ('0' & LOW) - HIGH;
					else
						DIFF <= ('0' & LOW) - HIGH + "10000000000000001";
					end if;											
				end process MUL_IDEA;	
				
	  O_1 <= DIFF(15 downto 0);	
		
end Behavioral;

