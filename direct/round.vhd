----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:    21:09:50 05/15/2020 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
    Port ( X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_6 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is

	COMPONENT mulop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT addop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT xorop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;

signal A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10 : std_logic_vector(15 downto 0);
	 
begin
	MUL_1: mulop PORT MAP (
          I_1 => X_1,
          I_2 => Z_1,
          O_1 => A_1
        );		  
	ADD_1: addop PORT MAP (
          I_1 => X_2,
          I_2 => Z_2,
          O_1 => A_2
        );		  
	ADD_2: addop PORT MAP (
          I_1 => X_3,
          I_2 => Z_3,
          O_1 => A_3
        );
	MUL_2: mulop PORT MAP (
          I_1 => X_4,
          I_2 => Z_4,
          O_1 => A_4
        );
	XOR_1: xorop PORT MAP (
          I_1 => A_1,
          I_2 => A_3,
          O_1 => A_5
        );	
	XOR_2: xorop PORT MAP (
          I_1 => A_2,
          I_2 => A_4,
          O_1 => A_6
        );
	ADD_3: addop PORT MAP (
          I_1 => A_6,
          I_2 => A_7,
          O_1 => A_8
        );
	MUL_3: mulop PORT MAP (
          I_1 => A_5,
          I_2 => Z_5,
          O_1 => A_7
        );
	ADD_4: addop PORT MAP (
          I_1 => A_7,
          I_2 => A_10,
          O_1 => A_9
        );
	MUL_4: mulop PORT MAP (
          I_1 => A_8,
          I_2 => Z_6,
          O_1 => A_10
        );
	XOR_3: xorop PORT MAP (
          I_1 => A_1,
          I_2 => A_10,
          O_1 => Y_1
        );
	XOR_4: xorop PORT MAP (
          I_1 => A_2,
          I_2 => A_9,
          O_1 => Y_3
        );
	XOR_5: xorop PORT MAP (
          I_1 => A_3,
          I_2 => A_10,
          O_1 => Y_2
        );
	XOR_6: xorop PORT MAP (
          I_1 => A_4,
          I_2 => A_9,
          O_1 => Y_4
        );		  
		 

end Behavioral;

