// Testbench for JK Flip-Flop
`timescale 1ns/1ps

module jk_ff_tb;
    reg j, k, clk, rst;
    wire q;

    jk_ff uut(
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    always #5000 clk = ~clk;

    initial begin
        $dumpfile("jk_ff.vcd");
        $dumpvars(0, jk_ff_tb);

        $monitor("Time=%0t | J=%b K=%b | Q=%b", $time, j, k, q);

        clk = 0; rst = 1; j = 0; k = 0; #20000;
        rst = 0; j = 0; k = 1; #10000;
        j = 1; k = 0; #10000;
        j = 1; k = 1; #20000;
        j = 0; k = 1; #10000;
        j = 1; k = 0; #10000;
        $finish;
    end
endmodule
