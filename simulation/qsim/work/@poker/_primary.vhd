library verilog;
use verilog.vl_types.all;
entity Poker is
    port(
        DE0             : out    vl_logic;
        CLOCK           : in     vl_logic;
        Current_Seg     : out    vl_logic_vector(3 downto 0);
        Switch          : in     vl_logic;
        P1_Roll         : in     vl_logic;
        P2_Roll         : in     vl_logic;
        P1_Race         : in     vl_logic;
        P2_Race         : in     vl_logic;
        P1Score_Seg     : out    vl_logic_vector(1 downto 0);
        P2Score_Seg     : out    vl_logic_vector(1 downto 0);
        Random_Seg      : out    vl_logic_vector(3 downto 0);
        DE1             : out    vl_logic;
        DE2             : out    vl_logic;
        a               : out    vl_logic;
        b               : out    vl_logic;
        c               : out    vl_logic;
        d               : out    vl_logic;
        e               : out    vl_logic;
        f               : out    vl_logic;
        g               : out    vl_logic;
        Buzzer          : out    vl_logic;
        Gcol            : out    vl_logic_vector(7 downto 0);
        Rcol            : out    vl_logic_vector(7 downto 0);
        row             : out    vl_logic_vector(7 downto 0)
    );
end Poker;
