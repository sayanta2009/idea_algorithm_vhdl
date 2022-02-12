--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
--
-- Create Date:   12:50:08 06/06/2020
-- Design Name:   
-- Module Name:   /home/ise/TUM_Masters/Semester_4/VHDL_Lab/assignment_submission/submit/rcs1/tb_reg.vhd
-- Project Name:  idea_rcs1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg
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
 
ENTITY tb_reg IS
END tb_reg;
 
ARCHITECTURE behavior OF tb_reg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg
    PORT(
         CLK : IN  std_logic;
         ENABLE : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg PORT MAP (
          CLK => CLK,
          ENABLE => ENABLE,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc_reg: process
   begin		
      -- hold reset state for 100 ns.
--		D <= x"FFFF";
--		ENABLE <= '0';
--      wait for 100 ns;	
--		ENABLE <= '1';
--		wait for 100 ns;	
--		--ENABLE <= '0';
--      wait for CLK_period*10;
--      -- insert stimulus here 
--		D <= x"0123";
--		ENABLE <= '0';
--		wait for 100 ns;	
--		ENABLE <= '1';
--		wait for CLK_period*10;
      -- wait;
		D <= x"ABCD";
		ENABLE <= '0';
		
      wait for 100 ns;	
		
		ENABLE <= '1';
		
      wait for CLK_period*10;

      -- insert stimulus here 
		D <= x"1234";
		ENABLE <= '0';
		
      wait for CLK_period*10;
		
		ENABLE <= '1';
		
		wait for CLK_period*10;
   end process stim_proc_reg;

END;
