module PC(clk, rst, npc, pc_out, PCWr);
  input             rst, clk;
  input     [31:2]  npc;
  input             PCWr;
  output    [31:2]  pc_out;
  
  reg       [31:0]  npc_reg;
  
  always @(posedge clk or negedge rst)
  begin
     if (!rst)  
        npc_reg <= 32'h0000_3000;
     else if (PCWr)
        npc_reg <= {npc, 2'b00};
  end
  assign  pc_out = npc_reg[31:2];
endmodule