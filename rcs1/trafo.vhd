----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:42:25 05/16/2020 
-- Design Name: 
-- Module Name:    trafo - Behavioral 
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

entity trafo is
    Port ( X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end trafo;

architecture Behavioral of trafo is
	
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
	 
begin

	MUL_1: mulop PORT MAP (
          I_1 => X_1,
          I_2 => Z_1,
          O_1 => Y_1
        );		  
	ADD_1: addop PORT MAP (
          I_1 => X_3,
          I_2 => Z_2,
          O_1 => Y_2
        );		  
	ADD_2: addop PORT MAP (
          I_1 => X_2,
          I_2 => Z_3,
          O_1 => Y_3
        );
	MUL_2: mulop PORT MAP (
          I_1 => X_4,
          I_2 => Z_4,
          O_1 => Y_4
        );

end Behavioral;

