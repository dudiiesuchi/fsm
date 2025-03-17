`timescale 1ns / 1ps

module pair_detect(input clk, input inbits, input reset, output reg detect);

reg [1:0] state;

always @(posedge clk or posedge reset) begin 
    if (reset)
        state <= 2'b00;
    else begin
        case (state)
            2'b00: state <= (inbits) ? 2'b01 : 2'b10;  
            2'b01: state <= (inbits) ? 2'b11 : 2'b10;
            2'b10: state <= (inbits) ? 2'b01 : 2'b11;
            2'b11: state <= (inbits) ? 2'b01 : 2'b10;  // Fixed syntax error here
        endcase
    end
end

always @(posedge clk or posedge reset) begin 
    if (reset)
        detect <= 0;
    else
        detect <= (state == 2'b11) ? 1 : 0;
end

endmodule
