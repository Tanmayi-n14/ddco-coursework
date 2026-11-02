// Project: 4-Bit Ring Counter
// Initializes to 4'b1000 and circulates the single high bit

module ring_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'b1000;
        else
            q <= {q[0], q[3:1]}; // Rotate right
    end
endmodule
