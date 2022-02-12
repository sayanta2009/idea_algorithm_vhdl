----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:    18:08:49 07/12/2020 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
			  Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           CLK : in  STD_LOGIC;
           EN125 : in  STD_LOGIC;
           EN346 : in  STD_LOGIC;
           EN78 : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
			  S_T : in  STD_LOGIC_VECTOR (1 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
			  Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0));
end datapath;

architecture Behavioral of datapath is

    COMPONENT addop
    Port 
			( I_1 : in  STD_LOGIC_VECTOR(15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR(15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR(15 downto 0));
    END COMPONENT;
	 
    COMPONENT mulop
    PORT(
         I_1 : IN  STD_LOGIC_VECTOR(15 downto 0);
         I_2 : IN  STD_LOGIC_VECTOR(15 downto 0);
         O_1 : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;

    COMPONENT xorop
    PORT(
         I_1	 : in  STD_LOGIC_VECTOR(15 downto 0);
         I_2 : in  STD_LOGIC_VECTOR(15 downto 0);
         O_1 : out  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
	 
    COMPONENT reg
    PORT(
         CLK : IN  STD_LOGIC;
         ENABLE : IN  STD_LOGIC;
         D : IN  STD_LOGIC_VECTOR(15 downto 0);
         Q : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;

    COMPONENT mux4x1
    PORT(
         S : IN  STD_LOGIC_VECTOR(1 downto 0);
         D0 : IN  STD_LOGIC_VECTOR(15 downto 0);
         D1 : IN  STD_LOGIC_VECTOR(15 downto 0);
         D2 : IN  STD_LOGIC_VECTOR(15 downto 0);
         D3 : IN  STD_LOGIC_VECTOR(15 downto 0);
         O : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;

signal mux_1_op : STD_LOGIC_VECTOR (15 downto 0);
signal mux_2_op : STD_LOGIC_VECTOR (15 downto 0);
signal mux_3_op : STD_LOGIC_VECTOR (15 downto 0);
signal mux_4_op : STD_LOGIC_VECTOR (15 downto 0);
signal mul_op : STD_LOGIC_VECTOR (15 downto 0);
signal add_op : STD_LOGIC_VECTOR (15 downto 0);
signal xor_op : STD_LOGIC_VECTOR (15 downto 0);
signal r1_op : STD_LOGIC_VECTOR (15 downto 0);
signal r2_op : STD_LOGIC_VECTOR (15 downto 0);
signal r3_op : STD_LOGIC_VECTOR (15 downto 0);
signal r4_op : STD_LOGIC_VECTOR (15 downto 0);
signal r5_op : STD_LOGIC_VECTOR (15 downto 0);
signal r6_op : STD_LOGIC_VECTOR (15 downto 0);
signal r7_op : STD_LOGIC_VECTOR (15 downto 0);
signal r8_op : STD_LOGIC_VECTOR (15 downto 0);


begin

	mux1: mux4x1 PORT MAP (
			 S => S,
          D0 => X1,
          D1 => X4,
          D2 => Z5,
			 D3 => Z6,
			 O => mux_1_op
        );
		  
	mux2: mux4x1 PORT MAP (			 
			 S => S,
          D0 => Z1,
          D1 => Z4,
          D2 => r5_op,
			 D3 => r8_op,
			 O => mux_2_op
        );
		  
	mux3: mux4x1 PORT MAP (
          S => S,
			 D0 => X3,
          D1 => X2,
          D2 => r6_op,
			 D3 => r7_op,
			 O => mux_3_op
        );
		  
	mux4: mux4x1 PORT MAP (
          S => S_T,
			 D0 => Z3,
          D1 => Z2,
          D2 => mul_op,
			 D3 => mul_op,   
			 O => mux_4_op
        );
		  
	mul: mulop PORT MAP (
          I_1 => mux_1_op,
          I_2 => mux_2_op,
          O_1 => mul_op
        );
		  
	add: addop PORT MAP (
          I_1 => mux_3_op,
          I_2 => mux_4_op,
          O_1 => add_op
        );
		  
	xor_1: xorop PORT MAP (
          I_1 => mul_op,
          I_2 => add_op,
          O_1 => xor_op
        );
		  
	xor_2: xorop PORT MAP (
          I_1 => r3_op,
          I_2 => add_op,
          O_1 => Y3
        );
		
	xor_3: xorop PORT MAP (
          I_1 => r2_op,
          I_2 => mul_op,
          O_1 => Y2
        );
		  
	xor_4: xorop PORT MAP (
          I_1 => r4_op,
          I_2 => add_op,
          O_1 => Y4
        );
		  
	xor_5: xorop PORT MAP (
          I_1 => r1_op,
          I_2 => mul_op,
          O_1 => Y1
        );
	
		
	R1: reg PORT MAP (
          CLK => CLK,
          ENABLE => EN125,
          D => mul_op,
			 Q => r1_op
        );
		  
		  
	R2: reg PORT MAP (
          CLK => CLK,
          ENABLE => EN125,
          D => add_op,
			 Q => r2_op
        );
	
	R3: reg PORT MAP (
          CLK => CLK,
			 ENABLE => EN346,
          D => add_op,
			 Q => r3_op
        );
		  
	R4: reg PORT MAP (
          CLK => CLK,
          ENABLE => EN346,
          D => mul_op,
			 Q => r4_op
        );
		  
	R5: reg PORT MAP (
          CLK => CLK,
          ENABLE => EN125,
          D => xor_op,
			 Q => r5_op
        );
		  
	R6: reg PORT MAP (
          CLK => CLK,
          ENABLE => EN346,
          D => xor_op,
			 Q => r6_op
        );
		  
	R7: reg PORT MAP (
          CLK => CLK,
          ENABLE => EN78,
          D => mul_op,
			 Q => r7_op
        );
		  
	R8: reg PORT MAP (
          CLK => CLK,
          ENABLE => EN78,
          D => add_op,
			 Q => r8_op
        );	
		  
	Y1_TRAFO <=r1_op;
	Y2_TRAFO <=r2_op;
	Y3_TRAFO <=r3_op;
	Y4_TRAFO <=r4_op; 

end Behavioral;

