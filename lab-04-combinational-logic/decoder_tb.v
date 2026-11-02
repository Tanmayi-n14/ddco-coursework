// Testbench for 2:4 Decoder
`timescale 1ns/1ps

module decoder_tb;
    reg EN;
    reg [1:0] A;
    wire [3:0] Y;

    decoder uut(
        .EN(EN),
        .A(A),
        .Y(Y)
    );

    initial begin
        $dumpfile("DEC2_test.vcd");
        $dumpvars(0, decoder_tb);

        $monitor("Time = %0t | EN=%b | A=%b | Y=%b", $time, EN, A, Y);

        EN = 0; A = 2'b00; #5;
        EN = 1; A = 2'b00; #5;
        EN = 1; A = 2'b01; #5;
        EN = 1; A = 2'b10; #5;
        EN = 1; A = 2'b11; #5;
        EN = 0; A = 2'b10; #5;
        $finish;
    end
endmodule
