library verilog;
use verilog.vl_types.all;
entity ALUreg is
    port(
        clk             : in     vl_logic;
        ALUout          : in     vl_logic_vector(31 downto 0);
        ALURout         : out    vl_logic_vector(31 downto 0)
    );
end ALUreg;
