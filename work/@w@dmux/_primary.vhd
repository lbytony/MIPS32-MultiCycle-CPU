library verilog;
use verilog.vl_types.all;
entity WDmux is
    port(
        ALURout         : in     vl_logic_vector(31 downto 0);
        DRout           : in     vl_logic_vector(31 downto 0);
        PC4             : in     vl_logic_vector(31 downto 0);
        WDSel           : in     vl_logic_vector(1 downto 0);
        busW            : out    vl_logic_vector(31 downto 0)
    );
end WDmux;
