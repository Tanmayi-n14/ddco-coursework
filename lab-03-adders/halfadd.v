// Lab 3: Half Adder using structural gate primitives

module xor2(input wire i0, i1, output wire o4);
    assign o4 = i0 ^ i1;
endmodule

module and2(input wire i0, i1, output wire o2);
    assign o2 = i0 & i1;
endmodule

module halfadd(a, b, sum, cout);
    input a, b;
    output sum, cout;

    xor2 x0(a, b, sum);
    and2 a0(a, b, cout);
endmodule
