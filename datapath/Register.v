module IRreg(clk,IRWr,IMout,ins);
  input clk,IRWr;
  input [31:0]IMout;
  output reg [31:0]ins;
  always@(posedge clk)  
    if(IRWr)
        ins=IMout;
endmodule


module Areg(clk,busA,A);
  input clk;
  input [31:0]busA;
  output reg[31:0]A;
  always@(posedge clk)
    A=busA;
endmodule


module Breg(clk,busB,Bout);
  input clk;
  input [31:0]busB;
  output reg [31:0]Bout;
  always@(posedge clk)
    Bout=busB;
endmodule


module ALUreg(clk,ALUout,ALURout);
  input clk;
  input [31:0]ALUout;
  output reg [31:0]ALURout;
  always@(posedge clk)
  begin
    ALURout=ALUout;
  end
endmodule

module DMreg(clk,DMout,DRout);
  input clk;
  input [31:0]DMout;
  output reg[31:0]DRout;
  always@(posedge clk)
    DRout=DMout;
endmodule