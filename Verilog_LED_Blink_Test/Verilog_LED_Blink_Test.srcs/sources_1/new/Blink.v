`timescale 1ns / 1ps

module Blink(
    input wire clk,     // Clock input
    output wire led1,   // LED output
    output wire led2,   // LED output
    output wire led3,   // LED output
    output wire led4    // LED output
);

    parameter COUNTER_WIDTH = 25; // Define the counter width as a parameter

    reg [COUNTER_WIDTH-1:0] counter; // Counter with flexible width

    localparam LED2_OFFSET = 1;    // Offset for LED2 (one bit lower than LED1)
    localparam LED3_OFFSET = 2;    // Offset for LED3 (two bits lower than LED1)
    localparam LED4_OFFSET = 3;    // Offset for LED4 (three bits lower than LED1)

    always @(posedge clk) begin
        // Increment the counter on every clock edge
        counter <= counter + 1'b1;
    end

    // LED outputs are driven by different bits of the counter
    assign led1 = counter[COUNTER_WIDTH-1];      // LED1 output
    assign led2 = counter[COUNTER_WIDTH-1-LED2_OFFSET]; // LED2 output
    assign led3 = counter[COUNTER_WIDTH-1-LED3_OFFSET]; // LED3 output
    assign led4 = counter[COUNTER_WIDTH-1-LED4_OFFSET]; // LED4 output

endmodule
