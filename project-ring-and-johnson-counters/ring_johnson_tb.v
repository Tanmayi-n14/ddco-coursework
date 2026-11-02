// Testbench for 4-Bit Ring Counter & 4-Stage Johnson Counter
`timescale 1ns/1ps

module ring_johnson_tb;
    reg clk, reset;
    wire [3:0] q_ring;
    wire [3:0] q_johnson;

    ring_counter uut_ring (
        .clk(clk),
        .reset(reset),
        .q(q_ring)
    );

    johnson_counter uut_johnson (
        .clk(clk),
        .reset(reset),
        .q(q_johnson)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("ring_johnson_test.vcd");
        $dumpvars(0, ring_johnson_tb);

        $display("Time | Clk | Reset | Ring Q | Johnson Q");
        $display("---------------------------------------");
        $monitor("%0t | %b | %b | %b | %b", $time, clk, reset, q_ring, q_johnson);

        clk = 0; reset = 1; #15;
        reset = 0; #100;

        $finish;
    end
endmodule
