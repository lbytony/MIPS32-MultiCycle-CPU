library verilog;
use verilog.vl_types.all;
entity ByteSrcmux is
    port(
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end ByteSrcmux;
