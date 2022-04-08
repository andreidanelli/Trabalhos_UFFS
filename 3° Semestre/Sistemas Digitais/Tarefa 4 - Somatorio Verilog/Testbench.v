`include "Operating_Block.v"
`include "Control_Block.v"

module Testbench;
    reg start = 0;
    reg clk = 0;
    reg rst = 0;
    reg [7:0] value = 8'b00000001;
    reg [7:0] total = 8'b00000000;
    
    assign mtotal = total;
    set, rac, dec, cac, ready, mZero, overflow
    wire [7:0] mtotal;
    wire set, rac, dec, cac, ready, mZero, overflow;
    Control_Block BC(start, mZero, clk, rst, set, rac, dec, cac, ready);
    Operating_Block BO(value, set, rac, dec, cac, mZero, overflow, total);
    always #2 start <= ~start;
    always #1 clk <= ~clk;

    initial begin
        $dumpvars;
        #250;
        $finish;
    end
endmodule