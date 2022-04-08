module Adder( //Somador
    input [7:0] count, 
    input [7:0] value,
    output [7:0] out,
    output failure
);
    assign out = count + value;
    reg overflow = 0;
    assign failure = overflow;
    always @(out) begin        
        if(out > 8'b1)
            overflow <= 1'b1;
        else begin
            overflow <=1'b0;
        end
    end
endmodule
