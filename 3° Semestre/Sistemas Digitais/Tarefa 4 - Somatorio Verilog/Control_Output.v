module Control_Output(
    input M0, M1,
    output set, rac, dec, cac, ready
);
    assign set = ~M1 & ~M0;
    assign dec = ~M0 & M1;
    assign ready = ~(M1 ^ M0);
    assign rac = set, cac = dec;
endmodule
