`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 04:39:38 PM
// Design Name: 
// Module Name: seven_seg_decoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_seg_decoder_tb(

    );

    reg [3:0] digit;
    wire [6:0] seg;

    seven_seg_decoder sevenseg (.digit(digit),.seg(seg));

    initial
    begin
        digit = 4'd0;
        #10 digit = 4'd1;
        #10 digit = 4'd2;
        #10 digit = 4'd3;
        #10 digit = 4'd4;
        #10 digit = 4'd5;
        #10 digit = 4'd6;
        #10 digit = 4'd7;
        #10 digit = 4'd8;
        #10 digit = 4'd9;
        #10 digit = 4'd10;
    end
    
endmodule
