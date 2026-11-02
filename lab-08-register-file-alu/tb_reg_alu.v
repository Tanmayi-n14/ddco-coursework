// Testbench for 16-Bit Register File
`timescale 1ns/1ps

module tb_reg_alu;
    reg clk, reset, wr;
    reg [2:0] rd_addr_a, rd_addr_b, wr_addr;
    reg [15:0] d_in;
    wire [15:0] d_out_a, d_out_b;

    reg_file uut (
        .clk(clk),
        .reset(reset),
        .wr(wr),
        .rd_addr_a(rd_addr_a),
        .rd_addr_b(rd_addr_b),
        .wr_addr(wr_addr),
        .d_in(d_in),
        .d_out_a(d_out_a),
        .d_out_b(d_out_b)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_reg_alu.vcd");
        $dumpvars(0, tb_reg_alu);

        clk = 0; reset = 1; wr = 0;
        rd_addr_a = 3'b000; rd_addr_b = 3'b000; wr_addr = 3'b000;
        d_in = 16'h0000; #10;

        reset = 0;

        // Write 0xCDEF to Reg 3
        wr = 1; wr_addr = 3'b011; d_in = 16'hcdef; #10;

        // Write 0x3210 to Reg 7
        wr = 1; wr_addr = 3'b111; d_in = 16'h3210; #10;

        // Write 0x4567 to Reg 5
        wr = 1; wr_addr = 3'b101; d_in = 16'h4567; #10;

        // Write 0xBA98 to Reg 1
        wr = 1; wr_addr = 3'b001; d_in = 16'hba98; #10;

        // Read Ports
        wr = 0;
        rd_addr_a = 3'b011; rd_addr_b = 3'b111; #10; // Read R3 and R7
        rd_addr_a = 3'b001; rd_addr_b = 3'b101; #10; // Read R1 and R5

        $finish;
    end
endmodule
