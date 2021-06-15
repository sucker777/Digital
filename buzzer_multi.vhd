library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
-----------------------------------
entity buzzer_multi is
port(A,B:in std_logic_vector(11 downto 0);
		S:in std_logic_vector(1 downto 0);
		Y:out std_logic_vector(11 downto 0));
end buzzer_multi;
-----------------------------------
architecture oo of buzzer_multi is
begin
Y<=A when S="1" else
	"000000000000";
end oo;