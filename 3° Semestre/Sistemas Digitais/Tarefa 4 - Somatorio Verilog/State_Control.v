
module State_Control(
    input start, nill, clk, rst,
    output reg M0, M1
);
    wire wM0, wM1;
    assign wM0 = start & nill | start & ~M0 | ~M1 & M0 & nill | M1 & ~M0;
    assign wM1 = ~M1 & M0;
    always @(posedge clk or rst) begin
        if(rst) begin
            M0 <= 0;
            M1 <= 0;
        end
        else begin            
            M0 <= wM0;
            M1 <= wM1
        end
    end
endmodule