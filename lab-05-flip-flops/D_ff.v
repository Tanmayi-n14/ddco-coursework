// Lab 5: D Flip-Flop with Asynchronous Reset

module D_ff (
    input wire CLK,
    input wire D,
    input wire RST,
    output reg Q
);
    always @(posedge CLK or posedge RST) begin
        if (RST)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule
