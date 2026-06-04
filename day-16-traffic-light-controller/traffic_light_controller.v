`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 16
// Module Name : traffic_light_controller
// Description : Traffic Light Controller using Moore FSM
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller (
    input      i_clk,
    output reg o_red,
    output reg o_yellow,
    output reg o_green
);

reg [1:0] state;

localparam RED    = 2'b00,
           GREEN  = 2'b01,
           YELLOW = 2'b10;

initial begin
    state    = RED;
    o_red    = 1'b1;
    o_yellow = 2'b0;
    o_green  = 2'b0;
end

always @(posedge i_clk) begin
    case (state)
        RED: begin
            o_red <= 1'b1;
            o_yellow <= 1'b0;
            o_green <= 1'b0;

            state <= GREEN;
        end

        GREEN: begin
            o_red <= 1'b0;
            o_yellow <= 1'b0;
            o_green <= 1'b1;

            state <= YELLOW;
        end

        YELLOW: begin
            o_red <= 1'b0;
            o_yellow <= 1'b1;
            o_green <= 1'b0;

            state <= RED;
        end

        default: begin
            o_red <= 1'b1;
            o_yellow <= 1'b0;
            o_green <= 1'b0;

            state <= RED;
        end
    endcase
end

    
endmodule