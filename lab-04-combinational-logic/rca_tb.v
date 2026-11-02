// Testbench for 4-Bit Ripple Carry Adder
`timescale 1ns/1ps

module rca_tb;
    reg [3:0] i0, i1;
    reg cin;
    wire [3:0] sum;
    wire cout;

    fulladdR uut(
        .a(i0),
        .b(i1),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("rca_test.vcd");
        $dumpvars(0, rca_tb);

        $monitor("At time = %0t, i0=%b, i1=%b, cin=%b, sum=%b, cout=%b", $time, i0, i1, cin, sum, cout);

        i0 = 4'b0000; i1 = 4'b0000; cin = 0; #26;
        i0 = 4'b0000; i1 = 4'b0000; cin = 1; #10;
        i0 = 4'b0001; i1 = 4'b0001; cin = 0; #10;
        i0 = 4'b0001; i1 = 4'b0001; cin = 1; #10;
        i0 = 4'b0010; i1 = 4'b0010; cin = 0; #10;
        i0 = 4'b1010; i1 = 4'b1011; cin = 0; #10;
        i0 = 4'b1010; i1 = 4'b1011; cin = 1; #10;
        i0 = 4'b1100; i1 = 4'b1101; cin = 0; #10;
        i0 = 4'b1111; i1 = 4'b1110; cin = 0; #10;
        i0 = 4'b1111; i1 = 4'b1110; cin = 1; #10;
        $finish;
    end
endmodule
