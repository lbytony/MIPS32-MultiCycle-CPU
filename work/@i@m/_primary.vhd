library verilog;
use verilog.vl_types.all;
entity IM is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(11 downto 2);
        DMWr            : in     vl_logic;
        Instr           : out    vl_logic_vector(31 downto 0)
    );
end IM;
