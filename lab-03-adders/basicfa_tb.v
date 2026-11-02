// Testbench for Full Adder
`timescale 1ns/1ps

module basicfa_tb;
    reg a, b, c;
    wire sum, carry;

    fulladd uut(
        .a(a),
        .b(b),
        .cin(c),
        .sum(sum),
        .cout(carry)
    );

    initial begin
        $dumpfile("fulladd_test.vcd");
        $dumpvars(0, basicfa_tb);

        $monitor("%0t a=%b, b=%b, c=%b, sum=%b, carry=%b", $time, a, b, c, sum, carry);

        a = 0; b = 0; c = 0; #5;
        a = 0; b = 0; c = 1; #5;
        a = 0; b = 1; c = 0; #5;
        a = 0; b = 1; c = 1; #5;
        a = 1; b = 0; c = 0; #5;
        a = 1; b = 0; c = 1; #5;
        a = 1; b = 1; c = 0; #5;
        a = 1; b = 1; c = 1; #5;
        $finish;
    end
endmodule
