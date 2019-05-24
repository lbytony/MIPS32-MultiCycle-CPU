library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        npc             : in     vl_logic_vector(31 downto 2);
        pc_out          : out    vl_logic_vector(31 downto 2);
        PCWr            : in     vl_logic
    );
end PC;
