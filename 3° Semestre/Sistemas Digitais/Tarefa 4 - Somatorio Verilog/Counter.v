module Counter(
    input set, dec,
    output wNill
);
    reg [3:0] cont = 4'b0;
    reg nill;
    wire wNill;
    assign wNill = nill;
    always @(set or dec) begin
        if(set) begin
            cont <= 4'b111;
            nill <= 0;
        end
        else begin
            if(dec) begin 
                cont <= cont - 1;
            end
            if(cont == 0) begin
                 nill <= 1;
            end
        end
    end   
endmodule
