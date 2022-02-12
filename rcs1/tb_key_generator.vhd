--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
--
-- Create Date:   15:30:41 06/14/2020
-- Design Name:   
-- Module Name:   /home/ise/TUM_Masters/Semester_4/VHDL_Lab/assignment_submission/submit/rcs1/tb_key_generator.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: key_generator
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
 
ENTITY tb_key_generator IS
END tb_key_generator;
 
ARCHITECTURE behavior OF tb_key_generator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal ROUND_NUMBER : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Z1 : std_logic_vector(15 downto 0);
   signal Z2 : std_logic_vector(15 downto 0);
   signal Z3 : std_logic_vector(15 downto 0);
   signal Z4 : std_logic_vector(15 downto 0);
   signal Z5 : std_logic_vector(15 downto 0);
   signal Z6 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_generator PORT MAP (
          KEY => KEY,
          ROUND_NUMBER => ROUND_NUMBER,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Z5 => Z5,
          Z6 => Z6
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		KEY <= 	x"00010002000300040005000600070008"; -- 32*4 =128 bit key
		ROUND_NUMBER <= "0000"; --x"0"
      wait for 100 ns;	                                                                
		ROUND_NUMBER <= "0001";--x"1"; 
      wait for 100 ns;	
		ROUND_NUMBER <= "0010";--x"2"; 
      wait for 100 ns;	
		ROUND_NUMBER <= "0011";--x"3"; 
      wait for 100 ns;	
		ROUND_NUMBER <= "0100";--x"4"; 
      wait for 100 ns;	                                                                                                        
		ROUND_NUMBER <= "0101";--x"5"; 
      wait for 100 ns;	
		ROUND_NUMBER <= "0110";--x"6"; 
      wait for 100 ns;	
		ROUND_NUMBER <= "0111";--x"7"; 
      wait for 100 ns;	
		ROUND_NUMBER <= "1000";--x"8"; 
      wait for 100 ns;	
      --wait for <clock>_period*10;

      -- insert stimulus here 

      --wait;
   end process;

END;
