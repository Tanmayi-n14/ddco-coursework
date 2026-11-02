// tb_vm.v
`timescale 1ns/1ps

module tb_vm;

    reg clk;
    reg reset;
    reg [1:0] coin;
    wire dispense;

    // Instantiate the vending machine
    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .coin(coin),
        .dispense(dispense)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    initial begin
        $dumpfile("vending_machine.vcd");
        $dumpvars(0, tb_vm);

        reset = 1;
        coin = 2'b00;
        #10;
        reset = 0;

        // Insert ₹5
        coin = 2'b01;
        #10;
        
        // Insert ₹10
        coin = 2'b10;
        #10;

        // Wait and reset
        coin = 2'b00;
        #20;
        
        // Insert ₹10
        coin = 2'b10;
        #10;
        
        // Insert ₹10 again
        coin = 2'b10;
        #10;

        // Finish simulation
        $finish;
    end

endmodule
