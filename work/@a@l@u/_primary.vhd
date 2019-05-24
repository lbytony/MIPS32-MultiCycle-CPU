library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        RD1             : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ALUOp           : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        overflow        : out    vl_logic;
        result          : out    vl_logic_vector(31 downto 0)
    );
end ALU;
