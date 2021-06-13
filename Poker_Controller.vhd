library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Poker_Controller is
port (clk:in std_logic;
    Switch:in std_logic;
    P1_Roll:in std_logic;
    P2_Roll:in std_logic;
    P1_Race:in std_logic;
    P2_Race:in std_logic;
    Random_Seg:out std_logic_vector(0 to 3);
    Current_Seg:out std_logic_vector(0 to 3);
    P1Score_Seg:out std_logic_vector(0 to 1);
    P2Score_Seg:out std_logic_vector(0 to 1));
end Poker_Controller;

architecture internal of Poker_Controller is
    signal temp:std_logic_vector(0 to 3):="0001";
    
    signal random_number:std_logic_vector(0 to 3);
    
    signal current_number:std_logic_vector(0 to 3):="0000";
    signal current_player:integer:=1;
    
    signal current_state:integer:=0;
    --0 = Wait for Roller
    --1 = In Competition
    --2 = Game End
    
    signal p1_score:std_logic_vector(0 to 1):="00";
    signal p2_score:std_logic_vector(0 to 1):="00";
    
    procedure Random(Random_output:out std_logic_vector(0 to 3)) is
    begin
        Random_output:=temp;
    end;

    begin
        --Random Counter
        process(clk)
        begin
            if rising_edge(clk) then
                if Switch = '1' then
                    if temp = "1101" then 
                        temp <= "0001";
                    else
                        temp <= temp + 1;
                    end if;
                end if;
            end if;
        end process;
        
        process(clk)
        variable Random_output:std_logic_vector(0 to 3);
        begin
            --Roller
            if rising_edge(clk) then
                --Is someone wins?
                if p1_score = "11" or p2_score = "11" then
                    current_state <= 2;
                end if;
                if Switch = '1' and current_state = 0 then
                    if P1_Roll = '1' and current_player = 1 then
                        Random(Random_output);
                        Random_Seg <= Random_output;
                        random_number <= Random_output;
                        if current_number = 13 then
                            current_number <= "0001";
                        else
                            current_number <= current_number + 1;
                        end if;
                        current_state <= 1;
                    end if;
                    if P2_Roll = '1' and current_player = 2 then
                        Random(Random_output);
                        Random_Seg <= Random_output;
                        random_number <= Random_output;
                        if current_number = 13 then
                            current_number <= "0001";
                        else
                            current_number <= current_number + 1;
                        end if;
                        current_state <= 1;
                    end if;
                end if;
            end if;
            
            --Competition
            if rising_edge(clk) then
                if Switch = '1' and current_state = 1 then
                    if current_number /= random_number then
                        current_state <= 0;
                        if current_player = 1 then
                            current_player <= current_player + 1;
                        else
                            current_player <= 1;
                        end if;
                    else
                        if P1_Race = '1' then
                            p1_score <= p1_score + 1;
                            current_state <= 0;
                            if current_player = 1 then
                                current_player <= current_player + 1;
                            else
                                current_player <= 1;
                            end if;
                        end if;
                        if P2_Race = '1' then
                            p2_score <= p2_score + 1;
                            current_state <= 0;
                            if current_player = 1 then
                                current_player <= current_player + 1;
                            else
                                current_player <= 1;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end process;

        Current_Seg <= current_number;
        P1Score_Seg <= p1_score;
        P2Score_Seg <= p2_score;
end internal;