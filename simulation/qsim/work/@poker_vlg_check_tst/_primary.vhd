library verilog;
use verilog.vl_types.all;
entity Poker_vlg_check_tst is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        Buzzer          : in     vl_logic;
        c               : in     vl_logic;
        Current_Seg     : in     vl_logic_vector(3 downto 0);
        d               : in     vl_logic;
        DE0             : in     vl_logic;
        DE1             : in     vl_logic;
        DE2             : in     vl_logic;
        e               : in     vl_logic;
        f               : in     vl_logic;
        g               : in     vl_logic;
        Gcol            : in     vl_logic_vector(7 downto 0);
        P1Score_Seg     : in     vl_logic_vector(1 downto 0);
        P2Score_Seg     : in     vl_logic_vector(1 downto 0);
        Random_Seg      : in     vl_logic_vector(3 downto 0);
        Rcol            : in     vl_logic_vector(7 downto 0);
        row             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Poker_vlg_check_tst;
