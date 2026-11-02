// Lab 5: JK Flip-Flop with Asynchronous Reset

module jk_ff (
    input wire j,       // J input
    input wire k,       // K input
    input wire clk,     // clock
    input wire rst,     // Asynchronous reset
    output reg q        // output
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;  // reset to 0
        else begin
            case ({j, k})
                2'b00: q <= q;       // no change
                2'b01: q <= 1'b0;    // reset
                2'b10: q <= 1'b1;    // set
                2'b11: q <= ~q;      // toggle
            endcase
        end
    end
endmodule
