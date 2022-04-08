`include "State_Control.v"
`include "Control_Output.v"

module Control_Block(
    input start, nill, clk, rst,
    output set, rac, dec, cac, ready
);
    wire wM0, wM1;
    State_Control FlipFlops(start, nill, clk, rst, wM0, wM1);
    Control_Output Exit(wM0, wM1, set, rac, dec, cac, ready);
endmodule


