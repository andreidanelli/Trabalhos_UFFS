module Accumulator(
    input cac, rac, 
    input [7:0] result,
    output  [7:0] sum
);
    reg [7:0] accumulator_ = 8'b00000000;
    assign sum = accumulator_;
    always @(cac or rac) begin
        if(rac) accumulator_ <=0;
        else begin
            accumulator_ <= result;
        end
    end
endmodule

