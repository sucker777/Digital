library verilog;
use verilog.vl_types.all;
entity Poker_Controller is
    port(
        clk             : in     vl_logic;
        Switch          : in     vl_logic;
        P1_Roll         : in     vl_logic;
        P2_Roll         : in     vl_logic;
        P1_Race         : in     vl_logic;
        P2_Race         : in     vl_logic;
        Random_Seg      : out    vl_logic_vector(0 to 3);
        Current_Seg     : out    vl_logic_vector(0 to 3);
        P1Score_Seg     : out    vl_logic_vector(0 to 1);
        P2Score_Seg     : out    vl_logic_vector(0 to 1)
    );
end Poker_Controller;
