`include "BO.v"
`include "BC.v"

module Resolve(
    input inicio,
    input clk,
    input rst,
    input [7:0] x,
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    output [15:0] result,
    output ready,
    output valid
);
    
    wire [1:0] m0;
    wire [1:0] m1;
    wire [1:0] m2;
    wire lx;
    wire h;
    wire ls;
    wire lh;

    BC Bloco_Controle(inicio, clk, rst, m0, m1, m2, h, lx, ls, lh, valid, ready);
    BO Bloco_Operativo(clk, a, b, c, x, m0, m1, m2, h, lx, ls, lh,  result);

endmodule