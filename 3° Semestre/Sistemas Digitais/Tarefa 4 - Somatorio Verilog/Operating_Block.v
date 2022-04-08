`include "Accumulator.v"
`include "Counter.v"
`include "Adder.v" // Somador

module Operating_Block(
    input [7:0] value,
    input set, rac, dec, cac,
    output nill, overflow,
    output [7:0] A_summ // Somatorio
);
    wire [7:0] SumInput; // Soma entrada
    reg [7:0] counting;
    Accumulator accumulator_(cac, rac, SumInput, A_summ);
    Adder adder_(A_summ, value, SumInput, overflow);
    Counter Counter_(set, dec, nill);
endmodule