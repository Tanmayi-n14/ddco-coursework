// Testbench for 4:1 Multiplexer
`timescale 1ns/1ps

module mux4_tb;
    reg [3:0] ii;
    reg s0, s1;
    wire yy;

    mux4 newMUX(
        .ii(ii),
        .s0(s0),
        .s1(s1),
        .yy(yy)
    );

    initial begin
        $dumpfile("MUX_test.vcd");
        $dumpvars(0, mux4_tb);

        ii = 4'b1000; s1 = 1; s0 = 1; #7;
        ii = 4'b0100; s1 = 1; s0 = 0; #7;
        ii = 4'b0010; s1 = 0; s0 = 1; #7;
        ii = 4'b0001; s1 = 0; s0 = 0; #7;
        $finish;
    end
endmodule
