--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
--
-- Create Date:   02:09:02 05/16/2020
-- Design Name:   
-- Module Name:   /home/ise/TUM_Masters/Semester_4/VHDL_Lab/xilinx_projects/direct/tb_round.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: round
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic_vector and
-- std_logic_vector_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_round IS
END tb_round;
 
ARCHITECTURE behavior OF tb_round IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal X_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z_4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z_5 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z_6 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y_1 : std_logic_vector(15 downto 0);
   signal Y_2 : std_logic_vector(15 downto 0);
   signal Y_3 : std_logic_vector(15 downto 0);
   signal Y_4 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: round PORT MAP (
          X_1 => X_1,
          X_2 => X_2,
          X_3 => X_3,
          X_4 => X_4,
          Z_1 => Z_1,
          Z_2 => Z_2,
          Z_3 => Z_3,
          Z_4 => Z_4,
          Z_5 => Z_5,
          Z_6 => Z_6,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4
        );

   -- Stimulus process
   stimulus_round: process
   begin		
			X_1 <= x"0000";
			X_2 <= x"0000";
			X_3 <= x"0000";
			X_4 <= x"0000";			
			Z_1 <= x"0000";
			Z_2 <= x"0000";
			Z_3 <= x"0000";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"0000";
			X_3 <= x"0000";
			X_4 <= x"0000";			
			Z_1 <= x"0000";
			Z_2 <= x"0000";
			Z_3 <= x"0000";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"0000";
			X_4 <= x"0000";			
			Z_1 <= x"0000";
			Z_2 <= x"0000";
			Z_3 <= x"0000";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"0000";			
			Z_1 <= x"0000";
			Z_2 <= x"0000";
			Z_3 <= x"0000";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"2492";			
			Z_1 <= x"0000";
			Z_2 <= x"0000";
			Z_3 <= x"0000";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"2492";			
			Z_1 <= x"db6d";
			Z_2 <= x"0000";
			Z_3 <= x"0000";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"2492";			
			Z_1 <= x"db6d";
			Z_2 <= x"1c71";
			Z_3 <= x"0000";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"2492";			
			Z_1 <= x"db6d";
			Z_2 <= x"1c71";
			Z_3 <= x"cccc";
			Z_4 <= x"0000";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"2492";			
			Z_1 <= x"db6d";
			Z_2 <= x"1c71";
			Z_3 <= x"cccc";
			Z_4 <= x"0002";
			Z_5 <= x"0000";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"2492";			
			Z_1 <= x"db6d";
			Z_2 <= x"1c71";
			Z_3 <= x"cccc";
			Z_4 <= x"0002";
			Z_5 <= x"eeee";
			Z_6 <= x"0000";
			wait for period/10;
			
			X_1 <= x"ffff";
			X_2 <= x"aaaa";
			X_3 <= x"5555";
			X_4 <= x"2492";			
			Z_1 <= x"db6d";
			Z_2 <= x"1c71";
			Z_3 <= x"cccc";
			Z_4 <= x"0002";
			Z_5 <= x"eeee";
			Z_6 <= x"8888";
			wait for period/10;
   end process stimulus_round;

END;
