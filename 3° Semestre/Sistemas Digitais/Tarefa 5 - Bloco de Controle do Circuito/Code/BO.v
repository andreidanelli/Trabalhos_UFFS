`include "Registrador.v"
`include "Multiplexador.v"
`include "Ula.v"

module BO (
    input clk,
    input signed [15:0] a,
    input signed [15:0] b,
    input signed [15:0] c,
    input signed [7:0] x,
    input [1:0]m0,
    input [1:0]m1,
    input [1:0]m2,
    input lh,
    input h,
    input lx,
    input ls,
    output signed [15:0] resultado

);

    wire signed [15:0] x16;
    assign x16 = x;
    wire signed [15:0] out_X;
    wire signed [15:0] out_S;
    wire signed [15:0] out_H;
    wire signed [15:0] out_Mux0;
    wire signed [15:0] out_Mux1;
    wire signed [15:0] out_Mux2;
    wire signed [15:0] out_Ula;

    Registrador RegistradorLX(x16, clk, lx, out_X);
    Registrador RegistradorLS(out_Ula, clk, ls, out_S);
    Registrador RegistradorLH(outUla, clk, lh, outH);

    Multiplexador mux0(a, a, b, c, m0, out_Mux0);
    Multiplexador mux1(out_Mux0, out_X, out_S, out_H, m1, out_Mux1);
    Multiplexador mux2(out_X, out_Mux0, out_S, out_H, m2, out_Mux2);

    Ula ula0(out_Mux1, out_Mux2, h, out_Ula);

    assign resultado = out_S;
    
endmodule