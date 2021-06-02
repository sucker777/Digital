library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
---------------------------------
entity autoplay is
port( EN,CLK:in std_logic;
		Y:buffer std_logic_vector(11 downto 0));
end autoplay;
---------------------------------
architecture A of autoplay is
	signal Q:std_logic_vector(5 downto 0);
begin
	process(CLK)
	begin
		if CLK'event and CLK='1' then
			if EN='1' then
				if Q>=28 then
					Q<="000000";
				else
					Q<=Q+1;
				end if;
			end if;
		end if;
	end process;
---------------------------------	
	Y<="000000010000" when Q=0 else
		"000000010000" when Q=1 else
		"000000000100" when Q=2 else
		"000000000010" when Q=3 else
		"000000000100" when Q=4 else
		"000000000010" when Q=5 else
		"000000000001" when Q=6 else
		"000000000100" when Q=7 else
		"000000000010" when Q=8 else
		"000000000001" when Q=9 else
		"000000100000" when Q=10 else
		"000000010000" when Q=11 else
		"000000100000" when Q=12 else
		"000000010000" when Q=13 else
		"000000100000" when Q=14 else
		"000000100000" when Q=15 else
		"000000000001" when Q=16 else
		"000000100000" when Q=17 else
		"000000000001" when Q=18 else
		"000000000010" when Q=19 else
		"000000000100" when Q=20 else
		"000000000010" when Q=21 else
		"000000000010" when Q=22 else
		"000000010000" when Q=23 else
		"000000010000" when Q=24 else
		"000000000100" when Q=25 else
		"000000000010" when Q=26 else
		"000000000001" when Q=27 else
		"000000000000";
----------------------------------
end A;
