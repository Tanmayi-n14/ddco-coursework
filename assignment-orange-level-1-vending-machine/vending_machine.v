// vending_machine.v
module vending_machine (
    input clk,
    input reset,
    input [1:0] coin,      // 2'b01 = ₹5, 2'b10 = ₹10
    output reg dispense
);

    // State encoding
    parameter S0  = 2'b00;
    parameter S5  = 2'b01;
    parameter S10 = 2'b10;
    parameter S15 = 2'b11;

    reg [1:0] current_state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S0: case(coin)
                    2'b01: next_state = S5;
                    2'b10: next_state = S10;
                    default: next_state = S0;
                endcase
            S5: case(coin)
                    2'b01: next_state = S10;
                    2'b10: next_state = S15;
                    default: next_state = S5;
                endcase
            S10: case(coin)
                    2'b01: next_state = S15;
                    2'b10: next_state = S15;
                    default: next_state = S10;
                endcase
            S15: next_state = S0; // dispense and reset
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        dispense = 0;
        if (current_state == S15)
            dispense = 1;
    end

endmodule
