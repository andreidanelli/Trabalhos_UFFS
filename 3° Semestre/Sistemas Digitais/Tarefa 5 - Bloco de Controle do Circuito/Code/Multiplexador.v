module Multiplexador ( 

    input signed [15:0] a,
    input signed [15:0] b,
    input signed [15:0] c,
    input signed [15:0] d,
    input [1:0] selecao,
    output signed [15:0] out
);

    assign out = selecao == 0 ? a : selecao == 1 ? b : selecao == 2 ? c : d; 

endmodule