`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 21
// Module Name : round_robin_arbiter
// Description : 4-Request Round Robin Arbiter
//////////////////////////////////////////////////////////////////////////////////

module round_robin_arbiter (
    input            i_clk,
    input      [3:0] i_request,
    output reg [3:0] o_grant
);

reg [3:0] pointer;

initial begin
    pointer = 2'b00;
    o_grant = 2'b00;
end

always @(posedge i_clk) begin
    o_grant <= 4'b0000;

    case (pointer)
    // Priority: R0 > R1 > R2 > R3
    2'b00: begin
        if      (i_request[0]) begin o_grant <= 4'b0001; pointer <= 2'b01; end
        else if (i_request[1]) begin o_grant <= 4'b0010; pointer <= 2'b10; end
        else if (i_request[2]) begin o_grant <= 4'b0100; pointer <= 2'b11; end
        else if (i_request[3]) begin o_grant <= 4'b1000; pointer <= 2'b00; end
    end

    // Priority: R1 > R2 > R3 > R0
    2'b01: begin
        if      (i_request[1]) begin o_grant <= 4'b0010; pointer <= 2'b10; end
        else if (i_request[2]) begin o_grant <= 4'b0100; pointer <= 2'b11; end
        else if (i_request[3]) begin o_grant <= 4'b1000; pointer <= 2'b00; end
        else if (i_request[0]) begin o_grant <= 4'b0001; pointer <= 2'b01; end
    end

    // Priority: R2 > R3 > R0 > R1
    2'b10: begin
        if      (i_request[2]) begin o_grant <= 4'b0100; pointer <= 2'b11; end
        else if (i_request[3]) begin o_grant <= 4'b1000; pointer <= 2'b00; end
        else if (i_request[0]) begin o_grant <= 4'b0001; pointer <= 2'b01; end 
        else if (i_request[1]) begin o_grant <= 4'b0010; pointer <= 2'b10; end
    end

    // Priority: R3 > R0 > R1 > R2
    2'b11: begin
        if      (i_request[3]) begin o_grant <= 4'b1000; pointer <= 2'b00; end
        else if (i_request[0]) begin o_grant <= 4'b0001; pointer <= 2'b01; end 
        else if (i_request[1]) begin o_grant <= 4'b0010; pointer <= 2'b10; end
        else if (i_request[2]) begin o_grant <= 4'b0100; pointer <= 2'b11; end
    end
    
    default: o_grant <= 4'b0000;
    endcase

end
    
endmodule