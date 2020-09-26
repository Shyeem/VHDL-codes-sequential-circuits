--library declaration
library ieee;
use ieee.std_logic_1164.all;

--entity
entity D_flip_flop is
    port( D, Clock, Reset, Enable    : IN STD_LOGIC;
          Q1, Q2, Q3, Q4             : OUT STD_LOGIC );
end D_flip_flop;

--architecture

architecture behavior of D_flip_flop is
begin
----- Positive edge triggered D flip-flop using "wait"
-- If "wait" is used no sensitivity list is used
--In VHDL, Clock 'event is true whenever the clock signal changes.
    process 
	begin 
	   wait until ( Clock 'event AND Clock = '1' );
		Q1 <= D;
    end process;

----- Positive edge triggered D flip-flop with synchronous reset using "wait"
--synchronous reset depends on clock and will reset only after clock changes
    process 
	begin 
	   wait until ( Clock 'event AND Clock = '1' );
		if reset = '1' then
		   Q2 <= '0';
		else
		   Q2 <= D;
	end if;
   end process;

----- Positive edge triggered D flip-flop with asynchronous reset
--asynchronous reset does not depend on clock and can reset anytime
    process (Reset,Clock) --there is no "wait" so there is a sensitivity list
	begin  
	   if reset = '1' then
		Q3 <= '0';
	   elsif ( clock 'event AND clock = '1' ) then
		Q3 <= D;
	   end if;
   end process;

----- Positive edge triggered D flip-flop with asynchronous reset and enable
   process (Reset,Clock) 
	begin
	   if reset = '1' then
		Q4 <= '0';
  	   elsif ( clock 'event AND clock = '1' ) then
		if Enable = '1' then
		    Q4 <= D;
		end if;
	   end if;
   end process;

end behavior;
