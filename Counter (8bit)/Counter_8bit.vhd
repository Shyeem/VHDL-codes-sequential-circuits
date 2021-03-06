--library declaration;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--entity
entity Counter_8bit is
    port( Clock, Reset : IN STD_LOGIC;
          Max_count    : IN STD_LOGIC_VECTOR( 7 DOWNTO 0 );
          Count        : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 ) );
end Counter_8bit;

--architecture
architecture behavior of Counter_8bit is -- Declare signal(s) internal to module

signal internal_count : STD_LOGIC_VECTOR( 7 DOWNTO 0 );

begin
   count <= internal_count;
   process (Reset,Clock)
	begin -- Reset counter
	    if reset = '1' then
              internal_count <= "00000000";
	    elsif ( clock 'EVENT AND clock = '1' ) then
	      if internal_count < Max_count then -- Check for maximum count
		 internal_count <= internal_count + 1; -- Increment Counter
	      else -- Count >= Max_Count
		 internal_count <= "00000000"; -- reset Counter
	      end if;
            end if;
   end process;
end behavior;
