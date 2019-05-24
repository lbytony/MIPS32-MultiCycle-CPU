module getCtrl(state, zero, overflow, IRWr, PCWr, GPRDst, ALUSrc, Mem2Reg, GPRWr, MemWr, nPC_sel, ExtOp, ALUOp, j, jr, ByteSrc);
    input       [4:0]   state;
    input               zero, overflow;
    output reg          PCWr, IRWr, GPRWr, ALUSrc, j, jr, ByteSrc, nPC_sel;
    output reg  [1:0]   GPRDst, Mem2Reg, MemWr, ExtOp;
    output reg  [2:0]   ALUOp;

    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9, s10 = 10, 
              s11 = 11, s12 = 12, s13 = 13, s14 = 14, s15 = 15, s16 = 16, s17 = 17, s18 = 18, s19 = 19, 
              s20 = 20, s21 = 21;

    always @(*)
    begin
        case (state)
            s0:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 1;
                PCWr <= 1;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b00;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s1:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b00;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s2:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s3:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b01;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s4:
            begin
                ALUSrc <= 1;
                GPRWr <= 1;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b01;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s5:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b01;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b01;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s6:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s7:
            begin
                ALUSrc <= 0;
                GPRWr <= 1;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s8:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 1;
                IRWr <= 0;
                PCWr <= zero;
                ALUOp <= 3'b001;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b01;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s9:
            begin
                ALUSrc <= 0;
                GPRWr <= 1;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 1;
                ALUOp <= 3'b000;
                j <= 1;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b10;
                GPRDst <= 2'b10;
                ByteSrc <= 0;
            end
            s10:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b001;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s11:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b011;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s12:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 1;
                ALUOp <= 3'b001;
                j <= 0;
                jr <= 1;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b01;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s13:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b010;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b00;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s14:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b10;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s15:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 1;
                ALUOp <= 3'b011;
                j <= 1;
                jr <= 0;
                ExtOp <= 2'b00;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s16:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b01;
                GPRDst <= 2'b01;
                ByteSrc <= 1;
            end
            s17:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b10;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b01;
                ByteSrc <= 0;
            end
            s18:
            begin
                ALUSrc <= 1;
                GPRWr <= 1;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s19:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b100;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
            s20:
            begin
                ALUSrc <= 0;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b01;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b10;
                ByteSrc <= 0;
            end
            s21:
            begin
                ALUSrc <= 1;
                GPRWr <= 0;
                MemWr <= 2'b00;
                nPC_sel <= 0;
                IRWr <= 0;
                PCWr <= 0;
                ALUOp <= 3'b000;
                j <= 0;
                jr <= 0;
                ExtOp <= 2'b00;
                Mem2Reg <= 2'b00;
                GPRDst <= 2'b00;
                ByteSrc <= 0;
            end
        endcase
        if (overflow) GPRWr = 0;
    end
endmodule