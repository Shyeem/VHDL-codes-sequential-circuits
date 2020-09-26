library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;

-- architecture
architecture fsm1 of FSM is
  type state_type is (A,B,C);
  signal CS,NS : state_type;
begin
comb_proc: process(CS,In1)
begin
   case (CS) is
	when A => -- items regarding state A
	   Out1 <= '0';
	   if (In1 = '1') then NS <= B;
	   else NS <= A;
	   end if;
	when B => -- items regarding state B
	   Out1 <= '0';
	   if (In1 = '0') then NS <= C;
	   else NS <= B;
	   end if;
	when C => -- items regarding state ST2
	   Out1 <= '1';
  	   if (In1 = '1') then NS <= A;
	   else NS <= C; 
	   end if;
	when others => 
	   NS <= A;
end case;
end process comb_proc;

clock_proc: process(CLK,RST)
begin
   if (RST = '1') then
	CS <= A;
   elsif (rising_edge(CLK)) then
	CS <= NS;
   end if;
end process clock_proc;

end fsm1;