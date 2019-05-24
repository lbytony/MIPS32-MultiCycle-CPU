module GPRmux(rt, rd, GPRSel, rw);
  input [1:0] GPRSel;
  input [4:0] rt, rd;
  output reg [4:0] rw;
  always @(rt or rd or GPRSel)
  begin
    case(GPRSel)
      2'b00: rw = rt;
      2'b01: rw = rd;
      2'b10: rw = 31;
    endcase
  end
endmodule

module ALUmux(Bout, ext32, BSel, B);
  input BSel;
  input [31:0] Bout, ext32;
  output wire [31:0] B;
  assign B = (BSel)? ext32: Bout;
endmodule

module WDmux(ALURout,DRout,PC4,WDSel,busW);
  input   [31:0]  ALURout,DRout,PC4;
  input   [1:0]   WDSel;
  output reg [31:0]busW;
  always @(ALURout or DRout or PC4 or WDSel)
  begin
    case (WDSel)
      2'b00: busW = ALURout;
      2'b01: busW = DRout;
      2'b10: busW = PC4;
    endcase
  end
endmodule

module ByteSrcmux(data1, data2, sel, out);
  input   [31:0]  data1, data2;
  input           sel;
  output reg [31:0] out;
  always @(*)
  begin
    case (sel)
      1'b0: out = data1;
      1'b1: out = data2;
    endcase
  end
endmodule

module ex_lb(datain,sel, dataout);
input [31:0]datain;
output [31:0]dataout;
reg [31:0]dataout;
input [1:0]sel;
always@(*)
		case(sel)
		2'b00:
		begin
		if(datain[31]) dataout<={24'b111111111111111111111111,datain[7:0]};
		else dataout<={24'b000000000000000000000000,datain[7:0]}; 
		end
		2'b01:
		begin
		if(datain[31]) dataout<={24'b111111111111111111111111,datain[15:8]};
		else dataout<={24'b000000000000000000000000,datain[15:8]}; 
		end
		2'b10:
		begin
		if(datain[31]) dataout<={24'b111111111111111111111111,datain[23:16]};
		else dataout<={24'b000000000000000000000000,datain[23:16]}; 
		end
		2'b11:
		begin
		if(datain[31]) dataout<={24'b111111111111111111111111,datain[31:24]};
		else dataout<={24'b000000000000000000000000,datain[31:24]}; 
		end
		endcase
endmodule		