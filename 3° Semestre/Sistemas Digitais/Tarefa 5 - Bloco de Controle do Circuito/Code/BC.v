module BC (
    input clk,
    input rst,
    output [1:0] m1,
    output lx,
    output done,
    output ready
);

    reg[3:0] state;
    always @(posedge clk or rst)
    begin
        if (rst)
            state <= 0;
        else begin
            if ((state == 0 && ~permit) || state == 7)
                state <= 0;
            else 
                state <= state + 1;
        end
    end
    
    assign h = state == 1 ? 1 : state == 2 ? 1 : state == 3 ? 1 : state == 4 ? 1 : 0;
    assign ls = state == 2 ? 1 : state == 3 ? 0 : state == 4 ? 1 : state == 5 ? 0 : state == 6 ? 1 : state == 7 ? 0 : state == 8 ? 0 : 0;
    assign lh = state == 2 ? 0 : state == 3 ? 1 : state == 4 ? 0 : state == 5 ? 1 : 0;
    assign lx = state == 1 ? 1 : state == 2 ? 0 : state == 3 ? 0 : 0;
    assign m0 = state == 3 ? 1 : state == 4 ? 2 : state == 6 ? 3 : 0;
    assign m1 = state == 2 ? 1 : state == 3 ? 0 : state == 4 ? 0 : state == 5 ? 3 : state == 6 ? 3 : 0;  
    assign m2 = state == 2 ? 0 : state == 3 ? 2 : state == 4 ? 0 : state == 5 ? 2 : state == 6 ? 1 : 0;
    assign ready = state == 0 ? 1 : 0; 
    assign done = state == 7 ? 1 : 0;
        
endmodule
