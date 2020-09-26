--library declaration;
library ieee;
use ieee.std_logic_1164.all;


--entity
entity Shift_Register is
   port( clk,reset,shift    : IN STD_LOGIC;
	 d0 	  	    : IN STD_LOGIC;
	 q 	  	    : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end Shift_Register;

--architecture
architecture behavior of Shift_Register is

begin
   process(clk,reset,shift)
	begin
	   if (reset = '0') then
		q <= "0000";
	   elsif (rising_edge(clk)) then
		if (shift = '1') then
		   q(0) <= d0;
		   q(1) <= q(0);
		   q(2) <= q(1);
		   q(3) <= q(2);
	        end if;
           end if;
  end process;
end behavior;

