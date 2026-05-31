`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 15
// Module Name : sequence_detector_1101
// Description : Moore FSM Sequence detector for "1101"
//////////////////////////////////////////////////////////////////////////////////

module sequence_detector_1101 (
    input      i_clk,
    input      i_data,
    output reg o_detect_1101
);

reg [2:0] state;

localparam S0 = 3'b000,
           S1 = 3'b001,
           S2 = 3'b010,
           S3 = 3'b011,
           S4 = 3'b100;

initial begin
    state = S0;
    o_detect_1101 = 1'b0;
end

always @(posedge i_clk) begin
    case (state)

    S0: begin
        o_detect_1101 <= 1'b0;
        if (i_data)
            state <= S1;
        else
            state <= S0;
    end

    S1: begin
        o_detect_1101 <= 1'b0;
        if (i_data)
            state <= S2;
        else
            state <= S0;
    end 
    
    S2: begin
        o_detect_1101 <= 1'b0;
        if (i_data)
            state <= S2;
        else
            state <= S3; 
    end

    S3: begin
        o_detect_1101 <= 1'b0;
        if (i_data)
            state <= S4;
        else
            state <= S0;
    end

    S4: begin
        o_detect_1101 <= 1'b1;
        if (i_data)
            state <= S2;
        else
            state <= S0;
    end
    
    endcase
end
    
endmodule