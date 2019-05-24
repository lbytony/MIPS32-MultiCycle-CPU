library verilog;
use verilog.vl_types.all;
entity ALUmux is
    port(
        Bout            : in     vl_logic_vector(31 downto 0);
        ext32           : in     vl_logic_vector(31 downto 0);
        BSel            : in     vl_logic;
        B               : out    vl_logic_vector(31 downto 0)
    );
end ALUmux;
