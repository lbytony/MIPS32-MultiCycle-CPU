module NPC(curPC, nPC_sel, zero, j, jr, j_imm26, imm16, Data, nPC, PC32);
    input [29:0] curPC;
    input nPC_sel, zero, j, jr;
    input [25:0] j_imm26;
    input [15:0] imm16;
    input [31:0] Data;
    output reg [29:0] nPC;
    output reg [31:0] PC32;

    always@(nPC_sel or zero or j or jr or j_imm26 or Data or imm16 or curPC)
    begin
        PC32 <= {curPC, 2'b00};
        if (nPC_sel && zero)
        begin
            nPC = {{14{imm16[15]}}, imm16} + curPC;
        end
        else if (j)
        begin
            nPC = {curPC[29:26], j_imm26};
        end
        else if (jr)
            nPC = Data[31:2];
        else
            nPC = curPC + 1;
    end
endmodule