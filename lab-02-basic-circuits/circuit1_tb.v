// Testbench for circuit1
`timescale 1ns/1ps

module circuit1_tb;
    reg A, B, C;
    wire Y;

    circuit uut(
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
    );

    initial begin
        $dumpfile("circuit1.vcd");
        $dumpvars(0, circuit1_tb);

        $monitor("%0t A=%b, B=%b, C=%b, Y=%b", $time, A, B, C, Y);

        A = 0; B = 0; C = 0; #20;
        A = 0; B = 0; C = 1; #20;
        A = 0; B = 1; C = 0; #20;
        A = 0; B = 1; C = 1; #20;
        A = 1; B = 0; C = 0; #20;
        A = 1; B = 0; C = 1; #20;
        A = 1; B = 1; C = 0; #20;
        A = 1; B = 1; C = 1; #20;
        $finish;
    end
endmodule
