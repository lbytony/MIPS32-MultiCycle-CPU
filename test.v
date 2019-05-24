module test;
    reg clk, rst;
    mips MIPS(clk, rst);
    initial
        begin
            clk = 1'b0;
            rst = 1'b1;
            #5 rst = 1'b0;
            #5 rst = 1'b1;
        end
    always
        #50 clk = ~clk;
endmodule