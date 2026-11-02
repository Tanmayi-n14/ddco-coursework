// Testbench for Half Adder
`timescale 1ns/1ps

module halfadd_tb;
    reg a, b;
    wire sum, cout;

    halfadd uut(
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("halfadd_test.vcd");
        $dumpvars(0, halfadd_tb);

        $monitor("%0t a=%b, b=%b, sum=%b, cout=%b", $time, a, b, sum, cout);

        a = 0; b = 0; #5;
        a = 0; b = 1; #5;
        a = 1; b = 0; #5;
        a = 1; b = 1; #5;
        $finish;
    end
endmodule
