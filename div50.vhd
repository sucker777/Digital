library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
---------------------------------
entity div50 is
port( CLK:in std_logic;
		FOUT:buffer std_logic);
end div50;
---------------------------------
architecture Div_s2 of div50 is
	signal Q:std_logic_vector(17 downto 0);
begin
	process(CLK)
	begin
		if CLK'event and CLK='1' then
			if Q>=((50000000/100000)/2)-1 then
				Q<="000000000000000000";
				FOUT<=not FOUT;
			else
				Q<=Q+1;
			end if;
		end if;
	end process;
end Div_s2;