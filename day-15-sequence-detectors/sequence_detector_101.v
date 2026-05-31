`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 15
// Module Name : sequence_detector_101
// Description : Moore FSM Sequence detector for "101"
//////////////////////////////////////////////////////////////////////////////////

module sequence_detector_101 (
    input      i_clk,
    input      i_data,
    output reg o_detect_101
);

reg [1:0] state;

localparam S0 = 2'b00,
           S1 = 2'b01,
           S2 = 2'b10,
           S3 = 2'b11;

initial begin
    state = S0;
    o_detect_101 = 1'b0;
end

always @(posedge i_clk) begin
    case (state)

    S0: begin
        o_detect_101 <= 1'b0;
        if (i_data)
            state <= S1;
        else
            state <= S0;
    end

    S1: begin
        o_detect_101 <= 1'b0;
        if (i_data)
            state <= S1;
        else
            state <= S2;
    end 
    
    S2: begin
        o_detect_101 <= 1'b0;
        if (i_data)
            state <= S3;
        else
            state <= S0; 
    end

    S3: begin
        o_detect_101 <= 1'b1;
        if (i_data)
            state <= S1;
        else
            state <= S2; 
    end
    
    endcase
end
    
endmodule