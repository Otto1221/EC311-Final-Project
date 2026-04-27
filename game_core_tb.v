`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Simple testbench for game_core
// Forces the LED position so catches happen instantly (no waiting 200 ms)
//////////////////////////////////////////////////////////////////////////////////

module game_core_tb;

    reg clk;
    reg reset;
    reg [15:0] sw;
    wire [15:0] led;
    wire [7:0] score;

    game_core dut (
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .led(led),
        .score(score)
    );

    // 100 MHz clock
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Reset
        sw = 16'b0;
        reset = 1;
        #100;
        reset = 0;
        #100;

        // ---- Catch #1: force LED to position 3, flip switch 3 ----
        force dut.pos = 4'd3;
        #50;
        sw[3] = 1;        // rising edge on switch 3 -> catch
        #100;
        sw[3] = 0;
        release dut.pos;

        // Skip the 3-second pause
        force dut.stopped = 1'b0;
        #20;
        release dut.stopped;
        #100;

        // ---- Catch #2: position 7 ----
        force dut.pos = 4'd7;
        #50;
        sw[7] = 1;
        #100;
        sw[7] = 0;
        release dut.pos;

        force dut.stopped = 1'b0;
        #20;
        release dut.stopped;
        #100;

        // ---- Catch #3: position 10 ----
        force dut.pos = 4'd10;
        #50;
        sw[10] = 1;
        #100;
        sw[10] = 0;
        release dut.pos;

        force dut.stopped = 1'b0;
        #20;
        release dut.stopped;
        #100;

        // ---- Catch #4: position 5 ----
        force dut.pos = 4'd5;
        #50;
        sw[5] = 1;
        #100;
        sw[5] = 0;
        release dut.pos;

        force dut.stopped = 1'b0;
        #20;
        release dut.stopped;
        #100;

        // ---- Catch #5: this triggers the win at score 5 ----
        force dut.pos = 4'd8;
        #50;
        sw[8] = 1;
        #100;
        sw[8] = 0;
        release dut.pos;

        // Watch the fireworks for a bit
        #5000;

        $finish;
    end

endmodule