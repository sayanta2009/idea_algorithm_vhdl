----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
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

use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity roundcounter is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is

type STATE_TYPE is (SLEEP, SETUP, CALC);
signal CURRENT_STATE, NEXT_STATE: STATE_TYPE := SLEEP;
signal counter_value : std_logic_vector(3 downto 0) := "1000"; 

begin

counter_change_logic: process(CLK)
	begin
			if(rising_edge(CLK)) then
				if(counter_value /= "1000") then
					if(RESULT = '1') then
						counter_value <= counter_value + 1;
					else
						counter_value <= counter_value;
					end if;
					
				elsif(counter_value = "1000") then
					if(START = '1') then
						counter_value <= "0000";
					else
						counter_value <= "1000";
					end if;
				end if;			
			end if;		
	end process counter_change_logic;
	
	
state_assignment: process(CLK)
	begin
		if (rising_edge(CLK)) then
			 CURRENT_STATE <= NEXT_STATE;
		end if;
	end process state_assignment;
	

state_transition_logic: process(CURRENT_STATE, START, RESULT, counter_value)
	begin
		case CURRENT_STATE is
			when SLEEP =>
				INIT <='0';
				READY <= '1';
				if (START = '1') then
					NEXT_STATE <= SETUP;
				else
					NEXT_STATE <= SLEEP;
				end if;
				
			when SETUP =>
				INIT <= '1';
				READY <= '0';	
				NEXT_STATE <= CALC;
				
			when CALC =>
				INIT <= '0';
				READY <= '0';					
				if (RESULT = '0') then
					NEXT_STATE <= CALC;
				elsif (RESULT = '1' and counter_value = "1000") then
					next_state <= SLEEP;
				else
					next_state <= SETUP;
				end if;
		end case;
		
		if (counter_value = "0000") then
			S_i <= '1';
		else
			S_i <= '0';
		end if;
		
	end process state_transition_logic;
	
	TRAFO <= counter_value(3);
	ROUND <= counter_value;	
	
	
end Behavioral;

