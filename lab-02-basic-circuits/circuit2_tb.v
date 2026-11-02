// Testbench for circuit2
`timescale 1ns/1ps

module circuit2_tb;
    reg A2, B2, C2;
    wire Y;

    circuit2 uut(
        .A2(A2),
        .B2(B2),
        .C2(C2),
        .Y(Y)
    );

    initial begin
        $dumpfile("circuit.vcd");
        $dumpvars(0, circuit2_tb);

        $monitor("%0t A2=%b, B2=%b, C2=%b, Y=%b", $time, A2, B2, C2, Y);

        A2 = 0; B2 = 0; C2 = 0; #20;
        A2 = 0; B2 = 0; C2 = 1; #20;
        A2 = 0; B2 = 1; C2 = 0; #20;
        A2 = 0; B2 = 1; C2 = 1; #20;
        A2 = 1; B2 = 0; C2 = 0; #20;
        A2 = 1; B2 = 0; C2 = 1; #20;
        A2 = 1; B2 = 1; C2 = 0; #20;
        A2 = 1; B2 = 1; C2 = 1; #20;
        $finish;
    end
endmodule
