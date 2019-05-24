library verilog;
use verilog.vl_types.all;
entity ex_lb is
    port(
        datain          : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0)
    );
end ex_lb;
