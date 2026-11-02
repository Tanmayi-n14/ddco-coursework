// Lab 6: 2-Bit Synchronous Down Counter using JK Flip-Flops

// JK Flip-Flop with synchronous reset
module jkff (
    input wire clk,
    input wire reset,
    input wire j,
    input wire k,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;
            endcase
        end
    end
endmodule

// 2-bit synchronous down counter using JK flip-flops
module down_counter_2bit (
    input wire clk,
    input wire reset,
    output wire [1:0] q
);
    wire j0, k0, j1, k1;

    assign j0 = 1'b1;
    assign k0 = 1'b1;

    assign j1 = ~q[0];          // MSB toggles when q0 = 0 for down count
    assign k1 = ~q[0];

    jkff jkff0 (.clk(clk), .reset(reset), .j(j0), .k(k0), .q(q[0]));
    jkff jkff1 (.clk(clk), .reset(reset), .j(j1), .k(k1), .q(q[1]));
endmodule
