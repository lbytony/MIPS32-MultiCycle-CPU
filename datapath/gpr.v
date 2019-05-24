module GPR(clk, rst, GPRWr, rs, rt, rw, WD, RD1, RD2);
    input           clk, rst, GPRWr;
    input   [4:0]   rs, rt, rw;
    input   [31:0]  WD;
    output  [31:0]  RD1, RD2;

    reg     [31:0]  register[31:0];
    
    integer	i;
	initial	
	    begin
		    for (i = 0; i < 32; i = i + 1)
			    register[i] <= 32'b0;
	    end        
	always @(posedge clk or negedge rst)
	begin
        if (!rst)
            for (i = 0; i < 32; i = i + 1)
			    register[i] <= 32'b0;
        else if ((rw != 0) && (GPRWr == 1))
            register[rw] <= WD;
	end
    assign RD1 = (rs == 0)? 0: register[rs]; 
    assign RD2 = (rt == 0)? 0: register[rt];
endmodule