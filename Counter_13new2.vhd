library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter_13new2 is
port (start,clk,p1,p2: in std_logic;
		q : out std_logic_vector(3 downto 0 ) );
end counter_13new2;

architecture a of counter_13new2 is
signal qn : std_logic_vector(3 downto 0);
type bit is ('0','1');
signal p1_down : bit := '1';
signal p2_down : bit := '0';

begin
	process(clk,p1,p2)
begin

if (clk'event and clk = '1') then

	if(start = '1') then
		if (p1 = '1' and p1_down = '1') then 
			qn <= qn + 1;
			p1_down <= '0';
			p2_down <= '1';
		elsif (p2 = '1' and p2_down = '1') then 
			qn <= qn + 1;
			p1_down <= '1';
			p2_down <= '0';
		end if;
		if qn = "1101" then qn <= "0001";
		end if;
		
	end if;
	
	
end if;

q <= qn;
end process;
end a;