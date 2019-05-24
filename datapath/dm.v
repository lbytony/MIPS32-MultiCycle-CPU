module dm_4k(addr, din, we, clk, loadb, byte, dout);
    input   [11:2]  addr;   // address bus
    input   [31:0]  din;    // 32-bit input data
    input   [1:0]   we;     // memory write enable
    input           clk, loadb;    // clock
    input   [1:0]   byte;
    output wire  [31:0]  dout;   // 32-bit memory output

    reg [31:0] dm[1023:0];
    reg [31:0] lb;
    integer i;
    initial
    begin
        for (i = 0; i < 1024; i = i + 1)
            dm[i] = 0;
    end
    //assign dout = dm[addr];
    assign dout = (loadb)? lb: dm[addr];

    always @(*)
    begin
        case (byte)
                2'b00: lb = {{24{dm[addr][7]}}, dm[addr][7:0]};
                2'b01: lb = {{24{dm[addr][15]}}, dm[addr][15:8]};
                2'b10: lb = {{24{dm[addr][23]}}, dm[addr][23:16]};
                2'b11: lb = {{24{dm[addr][31]}}, dm[addr][31:24]};
        endcase
    end
    always @(posedge clk)
    begin
        if (we == 2'b01)
            dm[addr] <= din;
        else if(we == 2'b10)
            case (byte)
                2'b00:dm[addr][7:0] <= din[7:0];
                2'b01:dm[addr][15:8] <= din[7:0];
                2'b10:dm[addr][23:16] <= din[7:0];
                2'b11:dm[addr][31:24] <= din[7:0];
            endcase
    end
endmodule