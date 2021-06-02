library ieee;
use ieee.std_logic_1164.all;

entity seg is
port(
		CLK:in std_logic;
		a:in std_logic;
		b:in std_logic_vector(0 to 3);
		c:in std_logic_vector(0 to 1);
		d:in std_logic_vector(0 to 1);
		e:in std_logic;
		f:in std_logic_vector(0 to 3);
		de:out std_logic_vector(0 to 2);
		number:out std_logic_vector(0 to 6)
		);
end seg;

architecture oo of seg is
signal op:std_logic_vector(0 to 2);
signal temp:std_logic_vector(0 to 6);
begin
process(a, b, c, d, e, f, CLK)
begin
	if CLK'event and CLK='1' then
		case op is
			when "000" =>
				op<="001";
			when "001" =>
				op<="010";
			when "010" =>
				op<="011";
			when "011" =>
				op<="100";
			when "100" =>
				op<="101";
			when "101" =>
				op<="000";
			when others =>
				op<="001";
		end case;
	end if;
	
	case op is
		when "000" =>
		de <= "000";
		if a = '1' then
			temp <= "0110000";
		elsif a = '0' then
			temp <= "1111110";
		end if;
		when "001" =>
		de <= "001";
			case b is
				when "0000"=>
					temp <= "1111110";
				when "0001"=>
					temp <= "0110000";
				when "0010"=>
					temp <= "1101101";
				when "0011"=>
					temp <= "1111001";
				when "0100"=>
					temp <= "0110010";
				when "0101"=>
					temp <= "1011011";
				when "0110"=>
					temp <= "1011111";
				when "0111"=>
					temp <= "1110010";
				when "1000"=>
					temp <= "1111111";
				when "1001"=>
					temp <= "1111011";
				when others =>		
			end case;
		when "010" =>
		de <= "010";
			case c is
				when "00"=>
					temp <= "1111110";
				when "01"=>
					temp <= "0110000";
				when "10"=>
					temp <= "1101101";
				when "11"=>
					temp <= "1111001";
			end case;
		when "011" =>
		de <= "011";
			case d is
				when "00"=>
					temp <= "1111110";
				when "01"=>
					temp <= "0110000";
				when "10"=>
					temp <= "1101101";
				when "11"=>
					temp <= "1111001";
			end case;
		when "100" =>
		de <= "100";
			if e = '1' then
				temp <= "0110000";
			elsif e = '0' then
				temp <= "1111110";
			end if;
		when "101" =>
		de <= "101";
			case f is
				when "0000"=>
					temp <= "1111110";
				when "0001"=>
					temp <= "0110000";
				when "0010"=>
					temp <= "1101101";
				when "0011"=>
					temp <= "1111001";
				when "0100"=>
					temp <= "0110010";
				when "0101"=>
					temp <= "1011011";
				when "0110"=>
					temp <= "1011111";
				when "0111"=>
					temp <= "1110010";
				when "1000"=>
					temp <= "1111111";
				when "1001"=>
					temp <= "1111011";
				when others =>
			end case;
		when others =>
	end case;
end process;
number <= temp;
end oo;