--ROM=Read Only Memory. 
--That means we cannot write in it. Only read from it.
--we provide a data, an address and a clock and we get the output
--library declaration;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

--entity
entity ROM_memory is
   generic(Dwidth: integer :=8;
	   Awidth: integer :=3); --2**3=8 addresses of 8bits

port(   clk       :in std_logic;
	addr      :in std_logic_vector(Awidth-1 downto 0);
	data      :out std_logic_vector(Dwidth-1 downto 0)
     );
end entity ROM_memory;

--architecture
architecture behavior of ROM_memory is

signal rom_d, data_reg : std_logic_vector(Dwidth-1 downto 0); --rom data
signal addr_sel : std_logic_vector(2 downto 0); --address select

begin 
  addr_sel  <=  addr; 
  process(clk) 
	begin
	   data_reg <= rom_d;
   end process;

----Lookup table
   process (clk)
	begin
	   case (addr_sel) is
		when "000" => rom_d <= "10000000";
		when "001" => rom_d <= "10101010"; 
		when "010" => rom_d <= "01010101"; 
		when "011" => rom_d <= "10000011"; 
		when "100" => rom_d <= "00000000"; 
		when "101" => rom_d <= "10011001"; 
		when "110" => rom_d <= "10000001"; 
		when "111" => rom_d <= "11110000"; 
		when others => rom_d <= "00000000"; 
	   end case;

   end process;

data <= data_reg;

end architecture; 




