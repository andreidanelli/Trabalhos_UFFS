module FSM(
    input rst,
    input clk,
    input w,
    output y0,
    output y1,
    output y2
);

    reg[2:0] Q;
    wire[2:0] D;

    assign D[0] = ((~w & Q[0]) | (~w & ~Q[0]));
    assign D[1] = ((~w & Q[1]) | (~Q[0] & Q[1]) | (~w & Q[0] & ~Q[1]));
    assign D[2] = ((~w & Q[2]) | (~Q[0] & Q[2]) | (~w & Q[0] & Q[1] & ~Q[2]) | (~Q[1] & Q[2]));
    assign y0 = D[0];


    always @(posedge clk or rst) begin
        if (rst==1) 
            Q[0] <= 0;
        else 
            Q[0] = D;
    end

endmodule

module testbench;
    reg rst0 = 0;
    reg clk0 = 0;
    reg w0 = 0;
    wire y00;

    FSM FSM0(rst0, clk0, w0, y00);

    always #1 begin
        clk0<=~clk0;
    end
    
    initial begin
        $dumpvars;
        #1
        rst0 <= 1;
        #1
        rst0 <= 0;
        #1
        w0 <= 1;
        #10
        $finish;
    end

endmodule