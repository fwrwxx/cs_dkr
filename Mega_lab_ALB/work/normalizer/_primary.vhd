library verilog;
use verilog.vl_types.all;
entity normalizer is
    port(
        \in\            : in     vl_logic_vector(9 downto 0);
        enable          : in     vl_logic;
        \out\           : out    vl_logic_vector(9 downto 0)
    );
end normalizer;
