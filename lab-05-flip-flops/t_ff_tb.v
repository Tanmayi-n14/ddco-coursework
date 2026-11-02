// Testbench for T Flip-Flop
`timescale 1ns/1ps

module t_ff_tb;
    reg T, clk, rst;
    wire Q;

    t_ff uut(
        .T(T),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("t_ff.vcd");
        $dumpvars(0, t_ff_tb);

        clk = 0; rst = 1; T = 0; #15;
        rst = 0; T = 1; #50;
        T = 0; #20;
        rst = 1; #10;
        rst = 0; T = 1; #20;
        $finish;
    end
endmodule
