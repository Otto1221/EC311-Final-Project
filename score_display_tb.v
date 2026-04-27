`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2026 05:07:47 PM
// Design Name: 
// Module Name: score_display_tb
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


module score_display_tb(

    );
    
    reg clk;
    reg reset;
    reg [7:0] score;
    wire [7:0] digit_enable;
    wire [6:0] seg;

    score_display #(.SCAN_MAX(16'd5)) sd (.clk(clk), .reset(reset),.score(score),.digit_enable(digit_enable),.seg(seg));

    initial clk = 0;
    always #5 clk = ~clk;    

    initial
    begin
        reset = 1;
        #20 score = 8'd0;
        #2 reset = 0;
        #200 score = 8'd5;
        #200 score = 8'd9;
        #200 score = 8'd10;
        #200 score = 8'd15;
    end

endmodule
