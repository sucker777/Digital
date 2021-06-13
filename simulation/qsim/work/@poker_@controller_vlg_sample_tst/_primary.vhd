library verilog;
use verilog.vl_types.all;
entity Poker_Controller_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        P1_Race         : in     vl_logic;
        P1_Roll         : in     vl_logic;
        P2_Race         : in     vl_logic;
        P2_Roll         : in     vl_logic;
        Switch          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Poker_Controller_vlg_sample_tst;
