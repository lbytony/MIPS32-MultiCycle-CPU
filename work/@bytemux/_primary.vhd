library verilog;
use verilog.vl_types.all;
entity Bytemux is
    port(
        DMout           : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        Byteout         : out    vl_logic_vector(31 downto 0)
    );
end Bytemux;
