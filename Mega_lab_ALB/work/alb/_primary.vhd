library verilog;
use verilog.vl_types.all;
entity alb is
    port(
        R               : in     vl_logic_vector(9 downto 0);
        S               : in     vl_logic_vector(9 downto 0);
        CI              : in     vl_logic;
        sel             : in     vl_logic_vector(1 downto 0);
        F               : out    vl_logic_vector(9 downto 0);
        CO              : out    vl_logic;
        VO              : out    vl_logic;
        NO              : out    vl_logic;
        ZO              : out    vl_logic
    );
end alb;
