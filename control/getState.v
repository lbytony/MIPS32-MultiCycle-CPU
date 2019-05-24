module getState(clk, rst, opcode, funct, state);
    input               clk, rst;
    input       [5:0]   opcode, funct;
    output reg  [4:0]   state;

    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9, s10 = 10, 
              s11 = 11, s12 = 12, s13 = 13, s14 = 14, s15 = 15, s16 = 16, s17 = 17, s18 = 18, s19 = 19, 
              s20 = 20, s21 = 21;
    //Opcode          
    parameter RType = 6'b000000, ADDI = 6'b001000, ADDIU = 6'b001001, ORI = 6'b001101, 
              SW = 6'b101011, LW = 6'b100011, SB = 6'b101000, LB = 6'b100000,
              BEQ = 6'b000100, LUI = 6'b001111, J = 6'b000010, JAL = 6'b000011;
    //Funct
    parameter ADD = 6'b100000, ADDU = 6'b100001, SUB = 6'b100010, SUBU = 6'b100011, 
              SLT = 6'b101010, JR = 6'b001000;

    always @(posedge clk or negedge rst)
    begin
        if (!rst)
            state <= s0;
        else
        begin
            case (state)
                s0:
                begin
                    state <= s1;
                end
                s1:
                begin
                    case (opcode)
                        RType:
                        begin
                            case (funct)
                                ADDU:
                                    state <= s6;
                                SUBU:
                                    state <= s10;
                                SLT:
                                    state <= s11;
                                JR:
                                    state <= s12;
                            endcase
                        end
                        ORI:
                            state <= s13;
                        LW:
                            state <= s2;
                        SW:
                            state <= s2;
                        BEQ:
                            state <= s8;
                        LUI:
                            state <= s14;
                        J:
                            state <= s15;
                        JAL:
                            state <= s9;
                        LB:
                            state <= s2;
                        SB:
                            state <= s2;
                        ADDI:
                            state <= s19;
                        ADDIU:
                            state <= s21;
                    endcase
                end
                s2:
                begin
                    case (opcode)
                        LW:
                            state <= s3;
                        SW:
                            state <= s5;
                        LB:
                            state <= s3;
                        SB:
                            state <= s17;
                    endcase
                    
                end
                s3:
                begin
                    if (opcode == LW)
                        state <= s4;
                    else
                        state <= s16;
                end
                s4:
                begin
                    state <= s0;
                end
                s5:
                begin
                    state <= s0;
                end
                s6:
                begin
                    state <= s7;
                end
                s7:
                begin
                    state <= s0;
                end
                s8:
                begin
                    state <= s0;
                end
                s9:
                begin
                    state <= s20;
                end
                s10:
                begin
                    state <= s7;
                end
                s11:
                begin
                    state <= s7;
                end
                s12:
                begin
                    state <= s0;
                end
                s13:
                begin
                    state <= s18;
                end
                s14:
                begin
                    state <= s18;
                end
                s15:
                begin
                    state <= s0;
                end
                s16:
                begin
                    state <= s4;
                end
                s17:
                begin
                    state <= s0;
                end
                s18:
                begin
                    state <= s0;
                end
                s19:
                begin
                    state <= s18;   //addi;
                end
                s20:
                begin
                    state <= s0;    //jal
                end
                s21:
                begin
                    state <= s18;
                end
            endcase
        end
    end
endmodule