library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led88_2 is
port(clk:in std_logic;
	  GRcount:in std_logic_vector(0 to 6);
	  DE:in std_logic_vector(0 to 2);
	  row:out std_logic_vector(0 to 7); 
	  Gcol:out std_logic_vector(0 to 7);
	  Rcol:out std_logic_vector(0 to 7));
end led88_2;


architecture l88 of led88_2 is
type matrix is array (0 to 7) of std_logic_vector(0 to 7);
constant clrScr: matrix :=(("00000000"),
								  ("00000000"),
								  ("00000000"),
								  ("00000000"),
								  ("00000000"),
								  ("00000000"),
								  ("00000000"),
								  ("00000000"));
constant Gwin0: matrix :=(("01001110"),
								  ("11001010"),
								  ("01001010"),
								  ("01001110"),
								  ("01001000"),
								  ("01001000"),
								  ("11101000"),
								  ("00000000"));
constant Rwin0: matrix :=(("01110111"),
								  ("00010101"),
								  ("00010101"),
								  ("01110111"),
								  ("01000100"),
								  ("01000100"),
								  ("01110100"),
								  ("00000000"));
constant win1: matrix :=(("00000000"),
								  ("01010101"),
								  ("01010100"),
								  ("01010100"),
								  ("01010100"),
								  ("01111100"),
								  ("00101001"),
								  ("00000000"));
constant win2: matrix :=(("00000000"),
								  ("10101011"),
								  ("10101001"),
								  ("10101001"),
								  ("10101001"),
								  ("11111001"),
								  ("01010011"),
								  ("00000000"));
constant win3: matrix :=(("00000000"),
								  ("01010111"),
								  ("01010010"),
								  ("01010010"),
								  ("01010010"),
								  ("11110010"),
								  ("10100111"),
								  ("00000000"));
constant win4: matrix :=(("00000000"),
								  ("10101110"),
								  ("10100100"),
								  ("10100100"),
								  ("10100100"),
								  ("11100100"),
								  ("01001110"),
								  ("00000000"));
constant win5: matrix :=(("00000000"),
								  ("01011101"),
								  ("01001001"),
								  ("01001001"),
								  ("01001001"),
								  ("11001001"),
								  ("10011101"),
								  ("00000000"));
constant win6: matrix :=(("00000000"),
								  ("10111010"),
								  ("10010011"),
								  ("10010011"),
								  ("10010010"),
								  ("10010010"),
								  ("00111010"),
								  ("00000000"));
constant win7: matrix :=(("00000000"),
								  ("01110100"),
								  ("00100110"),
								  ("00100110"),
								  ("00100101"),
								  ("00100101"),
								  ("01110100"),
								  ("00000000"));
constant win8: matrix :=(("00000000"),
								  ("11101001"),
								  ("01001101"),
								  ("01001101"),
								  ("01001011"),
								  ("01001011"),
								  ("11101001"),
								  ("00000000"));
constant win9: matrix :=(("00000000"),
								  ("11010010"),
								  ("10011010"),
								  ("10011010"),
								  ("10010110"),
								  ("10010110"),
								  ("11010010"),
								  ("00000000"));						  								  							  
								  
signal row_counter:unsigned(0 to 2);

signal green1win:std_logic:='0';
signal red2win:std_logic:='0';
signal do_win:std_logic:='0';
constant clk_freq:integer:=12e4;
constant scan_freq:integer:=4;
signal clk_counter:integer;
signal frame_counter:integer:=0;

begin

win_proc:process(clk,frame_counter)
begin
if rising_edge(clk) then
	if GRcount="1111001" and DE="010" then
		green1win<='1';
		red2win<='0';
	elsif GRcount="1111001" and DE="011" then
		green1win<='0';
		red2win<='1';
	end if;

	 do_win <=  green1win or red2win;
	 
	if frame_counter> 12 then
		green1win<='0';
		red2win<='0';
		do_win <=  green1win or red2win;
	end if;
end if;
end process;

	counter_proc:process(clk,do_win)
	begin
	if do_win = '1' then
		if rising_edge(clk) then
			row_counter <= row_counter+1;
			if row_counter = 7 then
				frame_counter <= frame_counter+1;
			elsif frame_counter > 12 then
				frame_counter<=0;
			end if;
		end if;
	end if;
	end process;

	output_proc:process (row_counter)
	begin
		case frame_counter is
				when 0 =>
					if green1win = '1' then
						Gcol<= Gwin0(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= Rwin0(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 1 =>
					Gcol<= ClrScr(to_integer(row_counter));
					Rcol<= ClrScr(to_integer(row_counter));
					row <=(others => '0');
					row(to_integer(row_counter))<= '1';
				when 2 =>
					if green1win = '1' then
						Gcol<= win1(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win1(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 3 =>
					if green1win = '1' then
						Gcol<= win2(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win2(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 4 =>
					if green1win = '1' then
						Gcol<= win3(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win3(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 5 =>
					if green1win = '1' then
						Gcol<= win4(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win4(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 6 =>
					if green1win = '1' then
						Gcol<= win5(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win5(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 7 =>
					if green1win = '1' then
						Gcol<= win6(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win6(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 8 =>
					if green1win = '1' then
						Gcol<= win7(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win7(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 9 =>
					if green1win = '1' then
						Gcol<= win8(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win8(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when 10 =>
					if green1win = '1' then
						Gcol<= win9(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					elsif red2win = '1' then
						Rcol<= win9(to_integer(row_counter));
						Gcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					else 
						Gcol<= ClrScr(to_integer(row_counter));
						Rcol<= ClrScr(to_integer(row_counter));
						row <=(others => '0');
						row(to_integer(row_counter))<= '1';
					end if;
				when others=>
					Gcol<= ClrScr(to_integer(row_counter));
					Rcol<= ClrScr(to_integer(row_counter));
					row <=(others => '0');
					row(to_integer(row_counter))<= '1';
		end case;
		
	end process;
			
			
	
end l88;