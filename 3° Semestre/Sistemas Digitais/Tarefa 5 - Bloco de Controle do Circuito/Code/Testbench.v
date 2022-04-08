`include "Resolve.v"
module Testbench;

    reg clk = 0, rst = 0, inicio = 0;

    reg signed [7:0] x = 1;
    reg signed [15:0] a = 2;
    reg signed [15:0] b = 3;
    reg signed [15:0] c = 4;


    reg signed [15:0] result;
    reg [31:0] cont = 0;
    wire signed [15:0] y;
    wire valid, ready;

    Resolve Resolv(inicio, clk, rst, x, a, b, c, y, ready, valid);

    always #1 clk <= ~clk;

    initial begin
        $dumpvars;
        
        rst <= 1;

        #1;

        rst <= 0;
        inicio <= 1;
    
    #60
        $finish;
    end

endmodule