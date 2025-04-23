module CRC_5_tb;
    reg clk;
    reg rst;
    reg [15:0] M;       // Message input
    wire [4:0] CRC_out; // CRC output

    // Instantiate the CRC module
    CRC_5 uut (
        .clk(clk),
        .rst(rst),
        .M(M),
        .CRC_out(CRC_out)
    );

    initial begin
        clk = 0;
        rst = 1;
        M = 16'h911C; // Example message
        #10 rst = 0; // Release reset
        #10 M = 16'hDEF5; // End simulation
        #10 M = 16'h3561; // Another message
        #10 M = 16'h3EAF; // Another message
        #120 $finish; // End simulation
    end

    always #5 clk = ~clk; // Clock generation

    initial begin
        $monitor("Time: %0t | Message: %b | CRC: %b", $time, M, CRC_out);
    end

endmodule