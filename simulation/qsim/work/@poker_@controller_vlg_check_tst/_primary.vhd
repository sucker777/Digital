library verilog;
use verilog.vl_types.all;
entity Poker_Controller_vlg_check_tst is
    port(
        Current_Seg     : in     vl_logic_vector(0 to 3);
        P1Score_Seg     : in     vl_logic_vector(0 to 1);
        P2Score_Seg     : in     vl_logic_vector(0 to 1);
        Random_Seg      : in     vl_logic_vector(0 to 3);
        sampler_rx      : in     vl_logic
    );
end Poker_Controller_vlg_check_tst;
