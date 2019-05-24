library verilog;
use verilog.vl_types.all;
entity NPC is
    port(
        curPC           : in     vl_logic_vector(29 downto 0);
        nPC_sel         : in     vl_logic;
        zero            : in     vl_logic;
        j               : in     vl_logic;
        jr              : in     vl_logic;
        j_imm26         : in     vl_logic_vector(25 downto 0);
        imm16           : in     vl_logic_vector(15 downto 0);
        Data            : in     vl_logic_vector(31 downto 0);
        nPC             : out    vl_logic_vector(29 downto 0);
        PC32            : out    vl_logic_vector(31 downto 0)
    );
end NPC;
