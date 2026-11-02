// Testbench for simple_circuit
`timescale 1ns/1ps

module simple_circuit_tb;
    reg A, B, C;
    wire D, E;

    simple_circuit uut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E)
    );

    initial begin
        $dumpfile("simple_circuit.vcd");
        $dumpvars(0, simple_circuit_tb);

        $monitor("%0t A=%b, B=%b, C=%b | D=%b, E=%b", $time, A, B, C, D, E);

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
