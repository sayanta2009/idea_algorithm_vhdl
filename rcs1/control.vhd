----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    control - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC);
end control;

architecture Behavioral of control is

type STATES is (NO_ENCRYPTION, ROUND_MODULE1, ROUND_MODULE2, ROUND_MODULE3, ROUND_MODULE4, 
									ROUND_MODULE5, ROUND_MODULE6, ROUND_MODULE7, ROUND_MODULE8, OUTPUT_TRANS_MODULE);
signal NEXT_STATE, CURRENT_STATE: STATES;

begin
	STATE_ASSIGNMENT: process(CLK, START)
		 begin
			if (rising_edge(CLK)) then
				 CURRENT_STATE <= NEXT_STATE;
			end if;
	end process STATE_ASSIGNMENT;						  

	STATE_TRANSITION: process(CURRENT_STATE, START)
		begin

		case CURRENT_STATE is
			 when NO_ENCRYPTION =>	
					ROUND <= "1000";
					READY <= '1';
					EN <= '0';
					S <= '1';
					if START='1' then
						 NEXT_STATE <= ROUND_MODULE1;
					elsif START='0' then
						 NEXT_STATE <= NO_ENCRYPTION;
					end if;
				
			 when ROUND_MODULE1 =>	
					ROUND <= "0000";
					READY <= '0';
					EN <= '1';
					S <= '0';
					NEXT_STATE <= ROUND_MODULE2;

			when ROUND_MODULE2 =>	
					ROUND <= "0001";
					READY <= '0';
					EN <= '1';
					S <= '1';
					NEXT_STATE <= ROUND_MODULE3;

			when ROUND_MODULE3 =>	
					ROUND <= "0010";
					READY <= '0';
					EN <= '1';
					S <= '1';
					NEXT_STATE <= ROUND_MODULE4;

			when ROUND_MODULE4 =>	
					ROUND <= "0011";
					READY <= '0';
					EN <= '1';
					S <= '1';
					NEXT_STATE <= ROUND_MODULE5;

			when ROUND_MODULE5 =>	
					ROUND <= "0100";
					READY <= '0';
					EN <= '1';
					S <= '1';
					NEXT_STATE <= ROUND_MODULE6;

			when ROUND_MODULE6 =>	
					ROUND <= "0101";
					READY <= '0';
					EN <= '1';
					S <= '1';
					NEXT_STATE <= ROUND_MODULE7;
				
			when ROUND_MODULE7 =>	
					ROUND <= "0110";
					READY <= '0';
					EN <= '1';
					S <= '1';
					NEXT_STATE <= ROUND_MODULE8;
		
			when ROUND_MODULE8 =>	
					ROUND <= "0111";
					READY <= '0';
					EN <= '1';
					S <= '1';
					NEXT_STATE <= OUTPUT_TRANS_MODULE;

			when OUTPUT_TRANS_MODULE =>	
					ROUND <= "1000";
					READY <= '1';
					EN <= '0';
					S <= '1';
					NEXT_STATE <= NO_ENCRYPTION;
					
			when others =>
		end case;
		
	end process STATE_TRANSITION;

end Behavioral;

