// Project: 4-Stage Switch-Tail Ring Counter (Johnson Counter)
// Feedback: Inverted output of the last stage fed into the first stage
// Sequence: 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000 (8 distinct states)

module johnson_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {~q[0], q[3:1]}; // Inverted LSB fed into MSB
    end
endmodule
