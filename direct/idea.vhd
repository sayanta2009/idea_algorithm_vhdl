----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea - Structural 
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

entity idea is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Structural of idea is
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

signal YR1_1, YR1_2, YR1_3, YR1_4, YR2_1, YR2_2, YR2_3, YR2_4, YR3_1, YR3_2, YR3_3, YR3_4, YR4_1, YR4_2, YR4_3, YR4_4, YR5_1, YR5_2, YR5_3, YR5_4, 
			YR6_1, YR6_2, YR6_3, YR6_4, YR7_1, YR7_2, YR7_3, YR7_4, YR8_1, YR8_2, YR8_3, YR8_4: std_logic_vector(15 downto 0);

type key_type is array(51 downto 0) of std_logic_vector(15 downto 0);	
signal total_key_set : key_type;

begin	

	set_key_values: process(KEY)
	
		variable index: integer range 0 to 51;
		variable cyclic_modified_key: STD_LOGIC_VECTOR (127 downto 0);
		variable no_of_cyclic_rotations: integer;
		begin	
			index := 0;
			cyclic_modified_key := KEY;
			no_of_cyclic_rotations := 6;
			
			cyclic_rotation_iteration: for i in 1 to no_of_cyclic_rotations loop
					key_access: for k in 1 to 8 loop
							total_key_set(index) <= cyclic_modified_key((127 - (16*(k-1))) downto (127 - 16*k + 1));
							index := index +1;
					end loop key_access;
					cyclic_modified_key := cyclic_modified_key(102 downto 0) & cyclic_modified_key(127 downto 103);
			end loop cyclic_rotation_iteration;
					
			op_trafo_key_gen: for j in 1 to 4 loop
					total_key_set(index) <= cyclic_modified_key((127 - (16*(j-1))) downto (127 - 16*j + 1));
					index := index +1;
			end loop op_trafo_key_gen;
			
		end process set_key_values;

	round_1: round PORT MAP (
		 X_1 => X_1,
		 X_2 => X_2,
		 X_3 => X_3,
		 X_4 => X_4,
		 Z_1 => total_key_set(0),
		 Z_2 => total_key_set(1),
		 Z_3 => total_key_set(2),
		 Z_4 => total_key_set(3),
		 Z_5 => total_key_set(4),
		 Z_6 => total_key_set(5),
		 Y_1 => YR1_1,
		 Y_2 => YR1_2,
		 Y_3 => YR1_3,
		 Y_4 => YR1_4
	  );
	
	round_2: round PORT MAP (
		 X_1 => YR1_1,
		 X_2 => YR1_2,
		 X_3 => YR1_3,
		 X_4 => YR1_4,
		 Z_1 => total_key_set(6),
		 Z_2 => total_key_set(7),
		 Z_3 => total_key_set(8),
		 Z_4 => total_key_set(9),
		 Z_5 => total_key_set(10),
		 Z_6 => total_key_set(11),
		 Y_1 => YR2_1,
		 Y_2 => YR2_2,
		 Y_3 => YR2_3,
		 Y_4 => YR2_4
	  );

	round_3: round PORT MAP (
		 X_1 => YR2_1,
		 X_2 => YR2_2,
		 X_3 => YR2_3,
		 X_4 => YR2_4,
		 Z_1 => total_key_set(12),
		 Z_2 => total_key_set(13),
		 Z_3 => total_key_set(14),
		 Z_4 => total_key_set(15),
		 Z_5 => total_key_set(16),
		 Z_6 => total_key_set(17),
		 Y_1 => YR3_1,
		 Y_2 => YR3_2,
		 Y_3 => YR3_3,
		 Y_4 => YR3_4
	  );

	round_4: round PORT MAP (
		 X_1 => YR3_1,
		 X_2 => YR3_2,
		 X_3 => YR3_3,
		 X_4 => YR3_4,
		 Z_1 => total_key_set(18),
		 Z_2 => total_key_set(19),
		 Z_3 => total_key_set(20),
		 Z_4 => total_key_set(21),
		 Z_5 => total_key_set(22),
		 Z_6 => total_key_set(23),
		 Y_1 => YR4_1,
		 Y_2 => YR4_2,
		 Y_3 => YR4_3,
		 Y_4 => YR4_4
	  );
	  
	round_5: round PORT MAP (
		 X_1 => YR4_1,
		 X_2 => YR4_2,
		 X_3 => YR4_3,
		 X_4 => YR4_4,
		 Z_1 => total_key_set(24),
		 Z_2 => total_key_set(25),
		 Z_3 => total_key_set(26),
		 Z_4 => total_key_set(27),
		 Z_5 => total_key_set(28),
		 Z_6 => total_key_set(29),
		 Y_1 => YR5_1,
		 Y_2 => YR5_2,
		 Y_3 => YR5_3,
		 Y_4 => YR5_4
	  );
		  
	  round_6: round PORT MAP (
		 X_1 => YR5_1,
		 X_2 => YR5_2,
		 X_3 => YR5_3,
		 X_4 => YR5_4,
		 Z_1 => total_key_set(30),
		 Z_2 => total_key_set(31),
		 Z_3 => total_key_set(32),
		 Z_4 => total_key_set(33),
		 Z_5 => total_key_set(34),
		 Z_6 => total_key_set(35),
		 Y_1 => YR6_1,
		 Y_2 => YR6_2,
		 Y_3 => YR6_3,
		 Y_4 => YR6_4
	  );
	  
	  round_7: round PORT MAP (
		 X_1 => YR6_1,
		 X_2 => YR6_2,
		 X_3 => YR6_3,
		 X_4 => YR6_4,
		 Z_1 => total_key_set(36),
		 Z_2 => total_key_set(37),
		 Z_3 => total_key_set(38),
		 Z_4 => total_key_set(39),
		 Z_5 => total_key_set(40),
		 Z_6 => total_key_set(41),
		 Y_1 => YR7_1,
		 Y_2 => YR7_2,
		 Y_3 => YR7_3,
		 Y_4 => YR7_4
	  );
	  
	  round_8: round PORT MAP (
		 X_1 => YR7_1,
		 X_2 => YR7_2,
		 X_3 => YR7_3,
		 X_4 => YR7_4,
		 Z_1 => total_key_set(42),
		 Z_2 => total_key_set(43),
		 Z_3 => total_key_set(44),
		 Z_4 => total_key_set(45),
		 Z_5 => total_key_set(46),
		 Z_6 => total_key_set(47),
		 Y_1 => YR8_1,
		 Y_2 => YR8_2,
		 Y_3 => YR8_3,
		 Y_4 => YR8_4
	  );
	  
	  output_transformation: trafo PORT MAP (
		 X_1 => YR8_1,
		 X_2 => YR8_2,
		 X_3 => YR8_3,
		 X_4 => YR8_4,
		 Z_1 => total_key_set(48),
		 Z_2 => total_key_set(49),
		 Z_3 => total_key_set(50),
		 Z_4 => total_key_set(51),
		 Y_1 => Y_1,
		 Y_2 => Y_2,
		 Y_3 => Y_3,
		 Y_4 => Y_4
	  );

end Structural;

