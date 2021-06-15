library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
----------------------------------------------
entity mi_key is
port(EN,CLK:in std_logic;
	  MI3:buffer std_logic);
end mi_key;
----------------------------------------------
architecture oo of mi_key is
	signal Q:std_logic_vector(13 downto 0);
begin
	process(CLK)
	begin
		if CLK'event and CLK='1' then
			if EN='1' then
				if Q>=((1000000/659)/2)-1 then
					Q<="00000000000000";
					MI3<=not MI3;
				else
					Q<=Q+1;
				end if;
			end if;
		end if;
	end process;
end oo;