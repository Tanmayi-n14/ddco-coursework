// Testbench for 4:2 Encoder
`timescale 1ns/1ps

module enc4_tb;
    reg [3:0] D;
    wire [1:0] Y;

    enc4 uut(
        .D(D),
        .Y(Y)
    );

    initial begin
        $dumpfile("ENC4_test.vcd");
        $dumpvars(0, enc4_tb);

        D = 4'b0001; #6;
        D = 4'b0010; #6;
        D = 4'b0100; #6;
        D = 4'b1000; #6;
        $finish;
    end
endmodule
