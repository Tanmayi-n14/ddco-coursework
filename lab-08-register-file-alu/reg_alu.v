// Lab 8: 16-Bit Register File Integrated with ALU

// 1-bit D-Flip-Flop with Reset and Load
module dfrl (
    input wire clk, reset, load, in,
    output reg out
);
    always @(posedge clk) begin
        if (reset)
            out <= 1'b0;
        else if (load)
            out <= in;
    end
endmodule

// 16-bit register with Reset and Load
module dfrl_16 (
    input wire clk, reset, load,
    input wire [15:0] in,
    output wire [15:0] out
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : reg_bits
            dfrl dfrl_inst (
                .clk(clk),
                .reset(reset),
                .load(load),
                .in(in[i]),
                .out(out[i])
            );
        end
    endgenerate
endmodule

// 8-to-1 Multiplexer (16-bit wide)
module mux8_16 (
    input wire [15:0] i0, i1, i2, i3, i4, i5, i6, i7,
    input wire [2:0] sel,
    output reg [15:0] out
);
    always @(*) begin
        case (sel)
            3'b000: out = i0;
            3'b001: out = i1;
            3'b010: out = i2;
            3'b011: out = i3;
            3'b100: out = i4;
            3'b101: out = i5;
            3'b110: out = i6;
            3'b111: out = i7;
        endcase
    end
endmodule

// 8 x 16-Bit Register File
module reg_file (
    input wire clk, reset, wr,
    input wire [2:0] rd_addr_a, rd_addr_b, wr_addr,
    input wire [15:0] d_in,
    output wire [15:0] d_out_a, d_out_b
);
    wire [7:0] load;
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    // 3:8 Write Decoder
    assign load[0] = wr & (wr_addr == 3'b000);
    assign load[1] = wr & (wr_addr == 3'b001);
    assign load[2] = wr & (wr_addr == 3'b010);
    assign load[3] = wr & (wr_addr == 3'b011);
    assign load[4] = wr & (wr_addr == 3'b100);
    assign load[5] = wr & (wr_addr == 3'b101);
    assign load[6] = wr & (wr_addr == 3'b110);
    assign load[7] = wr & (wr_addr == 3'b111);

    dfrl_16 reg0 (clk, reset, load[0], d_in, r0);
    dfrl_16 reg1 (clk, reset, load[1], d_in, r1);
    dfrl_16 reg2 (clk, reset, load[2], d_in, r2);
    dfrl_16 reg3 (clk, reset, load[3], d_in, r3);
    dfrl_16 reg4 (clk, reset, load[4], d_in, r4);
    dfrl_16 reg5 (clk, reset, load[5], d_in, r5);
    dfrl_16 reg6 (clk, reset, load[6], d_in, r6);
    dfrl_16 reg7 (clk, reset, load[7], d_in, r7);

    // Read Port A MUX
    mux8_16 mux_a (r0, r1, r2, r3, r4, r5, r6, r7, rd_addr_a, d_out_a);

    // Read Port B MUX
    mux8_16 mux_b (r0, r1, r2, r3, r4, r5, r6, r7, rd_addr_b, d_out_b);
endmodule
