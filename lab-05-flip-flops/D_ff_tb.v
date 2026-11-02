// Testbench for D Flip-Flop
`timescale 1ns/1ps

module D_ff_tb;
    reg CLK, D, RST;
    wire Q;

    D_ff newD(
        .CLK(CLK),
        .D(D),
        .RST(RST),
        .Q(Q)
    );

    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("D_ff.vcd");
        $dumpvars(0, D_ff_tb);

        CLK = 0; RST = 1; D = 0; #12;
        RST = 0; D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        RST = 1; #10;
        RST = 0; #10;
        D = 0; #10;
        $finish;
    end
endmodule
