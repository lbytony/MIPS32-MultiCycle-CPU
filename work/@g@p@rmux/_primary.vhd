library verilog;
use verilog.vl_types.all;
entity GPRmux is
    port(
        rt              : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        GPRSel          : in     vl_logic_vector(1 downto 0);
        rw              : out    vl_logic_vector(4 downto 0)
    );
end GPRmux;
