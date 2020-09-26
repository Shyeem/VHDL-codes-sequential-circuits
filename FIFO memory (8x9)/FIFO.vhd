--Using VHDL, Design a FIFO memory. Make it 8-deep, 9 bits wide. 
--When the write signal is asserted, write to one of the 9 bit registers. 
--Use RdInc and WrInc as input signals to increment the pointers that indicate which register to read or write. 
--Use RdPtrClr and WrPtrClr as input signals which reset the pointers to point to the first register in the array. 
--Do not implement full or empty signals.   

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO8x9 is
   port(
      clk, rst           :  in std_logic;
      RdPtrClr, WrPtrClr :  in std_logic;    
      RdInc, WrInc       :  in std_logic;
      DataIn		 :  in std_logic_vector(8 downto 0);
      DataOut		 :  out std_logic_vector(8 downto 0);
      rden, wren	 :  in std_logic
	);
end entity FIFO8x9;

-- architecture
architecture RTL of FIFO8x9 is
	--signal declarations
	type fifo_array is array(0 to 7) of std_logic_vector(8 downto 0);  -- makes use of VHDL’s enumerated type
	signal fifo	     :  fifo_array;
	signal wrptr, rdptr  : unsigned(2 downto 0);

begin
 
array_CONTROL : process (clk) is
  begin 
    if rising_edge(clk) then
        if wren = '1' then
          fifo(to_integer(unsigned(wrptr(2 downto 0)))) <= DataIn;
	end if;
    end if;
end process array_CONTROL;

DataOut <= fifo(to_integer(unsigned(rdptr(2 downto 0))));

read_pointer : process (clk,rst) is
  begin 
     if(rst='0' and RdPtrClr='1') then 
        rdptr <= (others => '0');
     elsif(rising_edge(clk)) then
        if(rden='1' and RdInc='1' ) then 
    	   rdptr <= rdptr + "001"; 
   end if;
  end if;      
 end process read_pointer ; 

write_pointer : process (clk,rst) is
 begin 
     if(rst='0' and WrPtrClr='1') then 
   	wrptr <= (others => '0');
     elsif(rising_edge(clk)) then
   if(wren='1' and WrInc='1') then 
    wrptr <= wrptr + "001"; 
   end if;
  end if;      
 end process; 

end RTL;










