module ALU(
  input [31:0] RD1, B,
  input [2:0] ALUOp,
  output reg zero,
  output reg overflow,
  output reg [31:0] result
);
  reg [32:0] addi;
  always @(*) begin
    case (ALUOp)
      3'b000:   //addu, addiu
      begin
        result = RD1 + B;
        zero = (result == 0)? 1: 0;
        overflow = 0;
      end
      3'b001:   //subu, beq
      begin
        result = RD1 - B;
        zero = (result == 0)? 1: 0;
        overflow = 0;
      end
      3'b010:   //ori, lui
      begin
        result = RD1 | B;
        zero = (result == 0)? 1: 0;
        overflow = 0;
      end
      3'b011:   //slt (if (rs < rt) rd = 1 else rd = 0) A < B
      begin
        case ({RD1[31], B[31]})
          2'b00:
          begin
            result = (RD1[30:0] < B[30:0])? 1: 0;
            zero = (result == 0)? 1: 0;
            overflow = 0;
          end
          2'b01:
          begin
            result = 0;
            zero = 1;
            overflow = 0;
          end
          2'b10:
          begin
            result = 1;
            zero = 0;
            overflow = 0; 
          end
          2'b11:
          begin
            result = (RD1[30:0] < B[30:0])? 0: 1;
            zero = (result == 0)? 1: 0;
            overflow = 0;
          end
        endcase       
      end
      3'b100:   //addi
      begin 
        addi = {RD1[31], RD1} + {B[31], B};
        overflow = addi[32] ^ addi[31];
        result = addi[31:0];
        zero = 0;
      end
    endcase
  end
endmodule