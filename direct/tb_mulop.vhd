--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
--
-- Create Date:   03:58:08 05/06/2020
-- Design Name:   
-- Module Name:   /home/ise/TUM_Masters/Semester_4/VHDL_Lab/xilinx_projects/direct/tb_mulop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mulop IS
END tb_mulop;
 
ARCHITECTURE behavior OF tb_mulop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mulop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal I_2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O_1 : std_logic_vector(15 downto 0);
	
	constant total_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mulop PORT MAP (
          I_1 => I_1,
          I_2 => I_2,
          O_1 => O_1
        );

   -- Stimulus process
   stimulus_mul: process
   begin	
		I_1 <= x"0000";
		I_2 <= x"0000";
		wait for total_period/10;
		I_1 <= x"0001";
		I_2 <= x"0000";
		wait for total_period/10;
		I_1 <= x"0001";
		I_2 <= x"0001";
		wait for total_period/10;
		I_1 <= x"0003";
		I_2 <= x"0001";
		wait for total_period/10;
		I_1 <= x"0003";
		I_2 <= x"0003";
		wait for total_period/10;
		I_1 <= x"7fff";
		I_2 <= x"0003";
		wait for total_period/10;
		I_1 <= x"7fff";
		I_2 <= x"7fff";
		wait for total_period/10;
		I_1 <= x"ffff";
		I_2 <= x"7fff";
		wait for total_period/10;
		I_1 <= x"ffff";
		I_2 <= x"ffff";
		wait for total_period/10;
		I_1 <= x"8000";
		I_2 <= x"ffff";
		wait for total_period/10;
		I_1 <= x"8000";
		I_2 <= x"8000";
		wait for total_period/10;
		
   end process stimulus_mul;

END;
