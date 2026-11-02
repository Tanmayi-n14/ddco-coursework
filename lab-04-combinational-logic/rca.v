// Lab 4: 4-Bit Ripple Carry Adder using structural Full Adder primitives

module and2(input wire i0, i1, output wire o2);
    assign o2 = i0 & i1;
endmodule

module or2(input wire i0, i1, output wire o3);
    assign o3 = i0 | i1;
endmodule

module xor2(input wire i0, i1, output wire o4);
    assign o4 = i0 ^ i1;
endmodule

module fulladd(input wire a, b, cin, output wire sum, cout);
    wire [4:0] t;

    xor2 x0(a, b, t[0]);
    xor2 x1(t[0], cin, sum);

    and2 a0(a, b, t[1]);
    and2 a1(a, cin, t[2]);
    and2 a2(b, cin, t[3]);

    or2 o0(t[1], t[2], t[4]);
    or2 o1(t[3], t[4], cout);
endmodule

module fulladdR(input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);
    wire [2:0] c;

    fulladd u0(a[0], b[0], cin, sum[0], c[0]);
    fulladd u1(a[1], b[1], c[0], sum[1], c[1]);
    fulladd u2(a[2], b[2], c[1], sum[2], c[2]);
    fulladd u3(a[3], b[3], c[2], sum[3], cout);
endmodule
