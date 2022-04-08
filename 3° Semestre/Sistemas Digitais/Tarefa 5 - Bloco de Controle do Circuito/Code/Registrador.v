module Registrador (

    input signed [15:0] in,
    input clk,
    input r,
    output reg signed [15:0] out
);
    always @(posedge clk) begin
        if (r == 1) begin
            out <= in;
        end
    end

endmodule