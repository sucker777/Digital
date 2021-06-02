library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
----------------------------------------------
entity fa_key is
port(EN,CLK:in std_logic;
	  FA3:buffer std_logic);
end fa_key;
----------------------------------------------
architecture oo of fa_key is
	signal Q:std_logic_vector(13 downto 0);
begin
	process(CLK)
	begin
		if CLK'event and CLK='1' then
			if EN='1' then
				if Q>=((1000000/698)/2)-1 then
					Q<="00000000000000";
					FA3<=not FA3;
				else
					Q<=Q+1;
				end if;
			end if;
		end if;
	end process;
end oo;