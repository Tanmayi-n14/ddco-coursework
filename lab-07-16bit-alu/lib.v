// Lab 7: Gate library primitives for 16-bit ALU

module and2(input wire i0, i1, output wire o2);
    assign o2 = i0 & i1;
endmodule

module or2(input wire i0, i1, output wire o3);
    assign o3 = i0 | i1;
endmodule

module xor2(input wire i0, i1, output wire o4);
    assign o4 = i0 ^ i1;
endmodule

module xor3(input wire i0, i1, i2, output wire o);
    assign o = i0 ^ i1 ^ i2;
endmodule

module or3(input wire i0, i1, i2, output wire o);
    assign o = i0 | i1 | i2;
endmodule

module mux2(input wire i0, i1, j, output wire o);
    assign o = (j == 0) ? i0 : i1;
endmodule
