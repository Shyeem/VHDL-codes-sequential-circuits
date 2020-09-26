--library declaration;
library ieee;
use ieee.std_logic_1164.all;

--entity
entity Data_Register is
   port( clk,reset,load     : IN STD_LOGIC;
	 d 	  	    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	 q 	  	    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end Data_Register;

--architecture
architecture behavior of Data_Register is

begin
   process(clk,reset,load)
	begin
	   if (reset = '0') then
		q <= "00000000";
	   elsif (rising_edge(clk)) then
		if (load = '1') then
		   q <= d;
	        end if;
           end if;
end process;
end behavior;

