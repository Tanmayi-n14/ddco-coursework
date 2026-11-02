// Testbench for 2-Bit Synchronous Up Counter
`timescale 1ns/1ps

module tb_up;
    reg clk;
    reg reset;
    wire [1:0] q;

    up_counter_2bit uut(
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("up_counter_jk.vcd");
        $dumpvars(0, tb_up);

        $monitor("Time=%0t | Clk=%b | Reset=%b | Q1Q0=%b%b", $time, clk, reset, q[1], q[0]);

        clk = 0; reset = 1; #10;
        reset = 0; #55;
        reset = 1; #10;
        reset = 0; #45;
        $finish;
    end
endmodule
