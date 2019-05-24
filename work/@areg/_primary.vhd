library verilog;
use verilog.vl_types.all;
entity Areg is
    port(
        clk             : in     vl_logic;
        busA            : in     vl_logic_vector(31 downto 0);
        A               : out    vl_logic_vector(31 downto 0)
    );
end Areg;
