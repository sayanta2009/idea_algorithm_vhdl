----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sayanta Roychowdhury
-- 
-- Create Date:    15:12:01 06/14/2020 
-- Design Name: 
-- Module Name:    key_generator - Behavioral 
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

entity key_generator is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 DOWNTO 0);
           ROUND_NUMBER : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           Z1 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
           Z2 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
           Z3 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
           Z4 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
           Z5 : out  STD_LOGIC_VECTOR (15 DOWNTO 0);
           Z6 : out  STD_LOGIC_VECTOR (15 DOWNTO 0));
end key_generator;

architecture Behavioral of key_generator is
signal total_key: STD_LOGIC_VECTOR (95 DOWNTO 0); -- 6 KEYS OF 16 BITS EACH
	begin
	KEY_SELECTION: PROCESS (ROUND_NUMBER)
	begin
		case ROUND_NUMBER is
			when "0000" => 
				total_key <= KEY(127 DOWNTO 32);
			when "0001" => 
				total_key <= KEY(31 DOWNTO 0) & KEY(102 DOWNTO 39);
			when "0010" => 
				total_key <= KEY(38 DOWNTO 0) & KEY(127 DOWNTO 103) & KEY(77 DOWNTO 46);
			when "0011" => 
				total_key <= KEY(45 DOWNTO 0) & KEY(127 DOWNTO 78);
			when "0100" => 
				total_key <= KEY(52 DOWNTO 0) & KEY(127 DOWNTO 85);
			when "0101" => 
				total_key <= KEY(84 DOWNTO 53) & KEY(27 DOWNTO 0) & KEY(127 DOWNTO 92);
			when "0110" => 
				total_key <= KEY(91 DOWNTO 28) & KEY(2 DOWNTO 0) & KEY(127 DOWNTO 99);
			when "0111" => 
				total_key <= KEY(98 DOWNTO 3);
			when "1000" => 
				total_key <= KEY(105 DOWNTO 42) & x"00000000"; -- FOR O/P 16*4=64 BITS ARE REQUIRED, SO FILLING THE REST PART WITH 0
			when others => 
				total_key <= x"000000000000000000000000"; -- 24*4 = 96 BITS TOTAL
		end case;
	END PROCESS KEY_SELECTION;

	Z1 <= total_key(95 downto 80); 
	Z2 <= total_key(79 downto 64);
	Z3 <= total_key(63 downto 48);
	Z4 <= total_key(47 downto 32);
	Z5 <= total_key(31 downto 16);
	Z6 <= total_key(15 downto 0);

end Behavioral;

