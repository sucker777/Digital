library ieee;
use ieee.std_logic_1164.all;

entity Decimal is 
port( clk : in std_logic;
		counter : in std_logic_vector(3 downto 0);
		decimal : out std_logic;
		digit : out std_logic_vector(3 downto 0));
end Decimal;

architecture a of Decimal is
signal temp : std_logic_vector(2 downto 0);

begin
process(clk)
begin
if clk'event and clk='1' then
case counter is
	when "1010" =>
		decimal <= '1';
		digit <= "0000";
	when "1011" =>
		decimal <= '1';
		digit <= "0001";
	when "1100" =>
		decimal <= '1';
		digit <= "0010";
	when "1101" =>
		decimal <= '1';
		digit <= "0011";
	when others =>
		decimal <= '0';
		digit <= counter;
end case;
end if;


end process;

end a;