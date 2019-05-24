module mips(clk, rst);
    input clk, rst;
    //PC
    wire [29:0] curPC, nPC;
    wire [31:0] PC32;
    //Controller
    wire [5:0] opcode, funct;
    wire overflow, BSel, GPRWr, j, jr, IRWr, PCWr, ByteSrc, nPC_sel;
    wire [1:0] GPRDst, Mem2Reg, MemWr, ExtOp;
    wire [2:0] ALUOp;
    wire [4:0] state;
    //IFU
    wire [31:0] Instr, IMout;
    wire [4:0] rs, rt, rd, rw;
    wire [25:0] j_imm26;
    wire [15:0] imm16;
    wire [9:0] addr1, addr2;
    //ALU
    wire zero;
    wire [31:0] ALUout, ALURout;
    //GPR
    wire [31:0] RD1, RD1R, B, RD2, RD2R, WD;
    //DM
    wire [31:0] DMout;
    //EXT
    wire [31:0] ext32;
    //MUX
    wire [31:0] Byteout, DMRout, DMoutF;
    
    assign opcode = Instr[31:26];
    assign funct = Instr[5:0];
    assign imm16 = Instr[15:0];
    assign j_imm26 = Instr[25:0];
    assign rs = Instr[25:21];
    assign rt = Instr[20:16];
    assign rd = Instr[15:11];

    assign addr1 = curPC[9:0];
    assign addr2 = ALURout[11:2];
    
    PC U_PC(clk, rst, nPC, curPC, PCWr);
    NPC npc(curPC, nPC_sel, zero, j, jr, j_imm26, imm16, RD1R, nPC, PC32);
    im_4k U_IM(addr1, IMout);
    GPR U_RF(clk, rst, GPRWr, rs, rt, rw, WD, RD1, RD2);
    ALU alu(RD1R, B, ALUOp, zero, overflow, ALUout);
    EXT ext(imm16, ExtOp, ext32);
    dm_4k U_DM(addr2, RD2R, MemWr, clk, ByteSrc, ALURout[1:0], DMout);
    //Control
    getState getstate(clk, rst, opcode, funct, state);
    getCtrl getctrl(state, zero, overflow, IRWr, PCWr, GPRDst, BSel, Mem2Reg, GPRWr, MemWr, nPC_sel, ExtOp, ALUOp, j, jr, ByteSrc);
    //Register
    IRreg irreg(clk, IRWr, IMout, Instr);
    Areg areg(clk, RD1, RD1R);
    Breg breg(clk, RD2, RD2R);
    DMreg dmreg(clk, DMout, DMRout);
    ALUreg alureg(clk, ALUout, ALURout);
    //MUX
    ByteSrcmux bytesrcmux(DMRout, Byteout, ByteSrc, DMoutF);
    ex_lb bytemux(DMRout, ALURout[1:0], Byteout);
    ALUmux alumux(RD2R, ext32, BSel, B);
    GPRmux gprmux(rt, rd, GPRDst, rw);
    WDmux wdmux(ALURout, DMoutF, PC32, Mem2Reg, WD);
endmodule