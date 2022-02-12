----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_single - Structural 
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

entity idea_single is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_single;

architecture Structural of idea_single is

    COMPONENT round
    PORT(
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Z_1 : IN  std_logic_vector(15 downto 0);
         Z_2 : IN  std_logic_vector(15 downto 0);
         Z_3 : IN  std_logic_vector(15 downto 0);
         Z_4 : IN  std_logic_vector(15 downto 0);
         Z_5 : IN  std_logic_vector(15 downto 0);
         Z_6 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
	 COMPONENT trafo
    PORT(
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Z_1 : IN  std_logic_vector(15 downto 0);
         Z_2 : IN  std_logic_vector(15 downto 0);
         Z_3 : IN  std_logic_vector(15 downto 0);
         Z_4 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT control
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0);
         READY : OUT  std_logic;
         EN : OUT  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT key_generator
    PORT(
         KEY : IN  std_logic_vector(127 downto 0);
         ROUND_NUMBER : IN  std_logic_vector(3 downto 0);
         Z1 : OUT  std_logic_vector(15 downto 0);
         Z2 : OUT  std_logic_vector(15 downto 0);
         Z3 : OUT  std_logic_vector(15 downto 0);
         Z4 : OUT  std_logic_vector(15 downto 0);
         Z5 : OUT  std_logic_vector(15 downto 0);
         Z6 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT mux2x1
    PORT(
         S : IN  std_logic;
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT reg
    PORT(
         CLK : IN  std_logic;
         ENABLE : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
	 signal ROUND_IDENTIFIER: std_logic_vector(3 downto 0);
	 signal EN, S: std_logic;
	 signal reg1_ip, reg2_ip, reg3_ip, reg4_ip: std_logic_vector(15 downto 0); 
	 signal reg1_op,reg2_op, reg3_op, reg4_op: std_logic_vector(15 downto 0); 
	 signal key1, key2, key3, key4, key5, key6: std_logic_vector(15 downto 0);-- keys
	 signal mux1_op, mux2_op, mux3_op, mux4_op: std_logic_vector(15 downto 0);	 
	 
begin

	control_unit: control PORT MAP (
          CLK => CLOCK,
          START => START,
          ROUND => ROUND_IDENTIFIER,
          READY => READY,
          EN => EN,
          S => S
        );
		  
	register1: reg PORT MAP (
          CLK => CLOCK,
          ENABLE => EN,
          D => reg1_ip,
          Q => reg1_op
        );

   register2: reg PORT MAP (
          CLK => CLOCK,
          ENABLE => en,
          D => reg2_ip,
          Q => reg2_op
        );

   register3: reg PORT MAP (
          CLK => CLOCK,
          ENABLE => en,
          D => reg3_ip,
          Q => reg3_op
        );

   register4: reg PORT MAP (
          CLK => CLOCK,
          ENABLE => en,
          D => reg4_ip,
          Q => reg4_op
        );	
		  
	mux1: mux2x1 PORT MAP (	
          S => S,
          D0 => X_1,
          D1 => reg1_op,
          O => mux1_op
        );
		  
   mux2: mux2x1 PORT MAP (
          S => S,
          D0 => X_2,
          D1 => reg2_op,
          O => mux2_op
        );

   mux3: mux2x1 PORT MAP (
          S => S,
          D0 => X_3,
          D1 => reg3_op,
          O => mux3_op
        );

   mux4: mux2x1 PORT MAP (
          S => S,
          D0 => X_4,
          D1 => reg4_op,
          O => mux4_op
        );		  
		  
	round_module: round PORT MAP (
			 X_1 => mux1_op,
			 X_2 => mux2_op,
			 X_3 => mux3_op,
			 X_4 => mux4_op,
			 Z_1 => key1,
			 Z_2 => key2,
			 Z_3 => key3,
			 Z_4 => key4,
			 Z_5 => key5,
			 Z_6 => key6,
			 Y_1 => reg1_ip,
			 Y_2 => reg2_ip,
			 Y_3 => reg3_ip,
			 Y_4 => reg4_ip
		  );

	output_transformation: trafo PORT MAP (
          X_1 => reg1_op,
          X_2 => reg2_op,
          X_3 => reg3_op,
          X_4 => reg4_op,
          Z_1 => key1,
          Z_2 => key2,
          Z_3 => key3,
          Z_4 => key4,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4
        );		     
		  
   key_gener: key_generator PORT MAP (
          KEY => KEY,
          ROUND_NUMBER => ROUND_IDENTIFIER,
          Z1 => key1,
          Z2 => key2,
          Z3 => key3,
          Z4 => key4,
          Z5 => key5,
          Z6 => key6
        );		  
		  
end Structural;
