// Testbench for 16-Bit ALU
`timescale 1ns/1ps

module tb_alu;
    reg [1:0] op;
    reg [15:0] i0, i1;
    wire [15:0] o;
    wire cout;

    alu uut(
        .op(op),
        .i0(i0),
        .i1(i1),
        .o(o),
        .cout(cout)
    );

    initial begin
        $dumpfile("tb_alu.vcd");
        $dumpvars(0, tb_alu);

        $display("time | op | i0   | i1   | o(out)| cout");
        $display("----------------------------------------");
        $monitor("%0t | %b | %h | %h | %h | %b", $time, op, i0, i1, o, cout);

        // ADD (op = 00)
        op = 2'b00; i0 = 16'h0000; i1 = 16'h0000; #10;
        op = 2'b00; i0 = 16'haa55; i1 = 16'h55aa; #10;
        op = 2'b00; i0 = 16'hffff; i1 = 16'h0001; #10;
        op = 2'b00; i0 = 16'h0001; i1 = 16'h7fff; #10;

        // SUB (op = 01)
        op = 2'b01; i0 = 16'h0000; i1 = 16'h0000; #10;
        op = 2'b01; i0 = 16'haa55; i1 = 16'h55aa; #10;
        op = 2'b01; i0 = 16'hffff; i1 = 16'h0001; #10;
        op = 2'b01; i0 = 16'h0001; i1 = 16'h7fff; #10;

        // AND (op = 10)
        op = 2'b10; i0 = 16'h0000; i1 = 16'h0000; #10;
        op = 2'b10; i0 = 16'haa55; i1 = 16'h55aa; #10;
        op = 2'b10; i0 = 16'hffff; i1 = 16'h0001; #10;
        op = 2'b10; i0 = 16'h0001; i1 = 16'h7fff; #10;

        // OR (op = 11)
        op = 2'b11; i0 = 16'h0000; i1 = 16'h0000; #10;
        op = 2'b11; i0 = 16'haa55; i1 = 16'h55aa; #10;
        op = 2'b11; i0 = 16'hffff; i1 = 16'h0001; #10;
        op = 2'b11; i0 = 16'h0001; i1 = 16'h7fff; #10;

        $finish;
    end
endmodule
