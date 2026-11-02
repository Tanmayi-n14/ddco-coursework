// Lab 4: 4-to-1 Multiplexer

module mux4(
    input wire [3:0] ii,
    input wire s0, s1,
    output wire yy
);
    assign yy = s1 ? (s0 ? ii[3] : ii[2]) : (s0 ? ii[1] : ii[0]);
endmodule
