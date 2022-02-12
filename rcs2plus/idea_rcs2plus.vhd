----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_rcs2 - Structural 
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

entity idea_rcs2 is
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
end idea_rcs2;

architecture Structural of idea_rcs2 is

COMPONENT clockedround
    PORT(
         CLK : IN  std_logic;
         INIT : IN  std_logic;
         TRAFO : IN  std_logic;
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Z5 : IN  std_logic_vector(15 downto 0);
         Z6 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0);
         RESULT : OUT  std_logic;
         Y1_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y2_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y3_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y4_TRAFO : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;	 
    
COMPONENT reg 
    Port ( CLK : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

COMPONENT mux2x1
    Port ( S : in  STD_LOGIC; 
           D0 : in  STD_LOGIC_VECTOR (15 DOWNTO 0);
           D1 : in  STD_LOGIC_VECTOR (15 DOWNTO 0);
           O : out  STD_LOGIC_VECTOR (15 DOWNTO 0));
end COMPONENT;

COMPONENT roundcounter
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         RESULT : IN  std_logic;
         READY : OUT  std_logic;
         S_i : OUT  std_logic;
         INIT : OUT  std_logic;
         TRAFO : OUT  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
COMPONENT key_generator
    Port ( KEY : in  STD_LOGIC_VECTOR (127 DOWNTO 0);
				  ROUND_NUMBER : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
				  Z1 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
				  Z2 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
				  Z3 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
				  Z4 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
				  Z5 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
				  Z6 : out  STD_LOGIC_VECTOR (15 DOWNTO 0));
END COMPONENT;

signal mux1_out_signal, mux2_out_signal, mux3_out_signal, mux4_out_signal, z1_out_signal, z2_out_signal, z3_out_signal, z4_out_signal, z5_out_signal, 
			z6_out_signal, y1_out_signal, y2_out_signal, y3_out_signal, y4_out_signal, r1_out_signal, r2_out_signal, r3_out_signal, r4_out_signal : STD_LOGIC_VECTOR (15 downto 0);

Signal Round_signal : STD_LOGIC_VECTOR (3 downto 0);
signal Si_signal, Init_signal, Trafo_signal, Result_signal : STD_LOGIC;

begin

mux1: mux2x1 PORT MAP (
          S => si_signal,
          D0 => r1_out_signal,
          D1 => X_1,
			 O => mux1_out_signal
        );

mux2: mux2x1 PORT MAP (
          S => si_signal,
          D0 => r2_out_signal,
          D1 => X_2,
			 O => mux2_out_signal
        );
		  
mux3: mux2x1 PORT MAP (
          S => si_signal,
          D0 => r3_out_signal,
          D1 => X_3,
			 O => mux3_out_signal
        );

mux4: mux2x1 PORT MAP (
          S => si_signal,
          D0 => r4_out_signal,
          D1 => X_4,
			 O => mux4_out_signal
        );

R1: reg PORT MAP (
			CLK => CLOCK,
			ENABLE => Result_signal,
			D => y1_out_signal,
			Q => r1_out_signal);
			
R2: reg PORT MAP (
			CLK => CLOCK,
			ENABLE => Result_signal,
			D => y2_out_signal,
			Q => r2_out_signal);

R3: reg PORT MAP (
			CLK => CLOCK,
			ENABLE => Result_signal,
			D => y3_out_signal,
			Q => r3_out_signal);

R4: reg PORT MAP (
			CLK => CLOCK,
			ENABLE => Result_signal,
			D => y4_out_signal,
			Q => r4_out_signal);
			
Key_gen: key_generator PORT MAP (
			KEY => KEY,
			ROUND_NUMBER => Round_signal,
			Z1 => z1_out_signal,
			Z2 => z2_out_signal,			
			Z3 => z3_out_signal,
			Z4 => z4_out_signal,
			Z5 => z5_out_signal,
			Z6 => z6_out_signal);			
			
extended_round_module: clockedround PORT MAP (
			CLK=>CLOCK,
			TRAFO => Trafo_signal, 
			INIT => Init_signal, 
			X1 => mux1_out_signal,
			X2 => mux2_out_signal, 
			X3 => mux3_out_signal,
			X4 => mux4_out_signal,
			Z1=> z1_out_signal, 
			Z2 => z2_out_signal, 
			Z3 => z3_out_signal, 
			Z4 => z4_out_signal, 
			Z5 => z5_out_signal, 
			Z6 => z6_out_signal,
			Y1 => y1_out_signal, 
			Y2 => y2_out_signal, 
			Y3 => y3_out_signal, 
			Y4 => y4_out_signal,
			RESULT => Result_signal,
			Y1_TRAFO => Y_1,
			Y2_TRAFO => Y_2,
			Y3_TRAFO => Y_3,
			Y4_TRAFO => Y_4);

round_counter: roundcounter PORT MAP (
			CLK => CLOCK, 
			START=> START, 
			RESULT=> Result_signal,
			READY=> READY,
			S_i => si_signal, 
			INIT => Init_signal, 
			TRAFO=> Trafo_signal, 
			ROUND => Round_signal);

end Structural;

