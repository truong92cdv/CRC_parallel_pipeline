module CRC_8_tb;
    reg clk;
    reg rst;
    reg [71:0] M;       // Message input
    wire [7:0] CRC_out; // CRC output

    // Instantiate the CRC module
    CRC_8 uut (
        .clk(clk),
        .rst(rst),
        .M(M),
        .CRC_out(CRC_out)
    );

    initial begin
        clk = 0;
        rst = 1;
        M = {64'h1234567890ABCDEF, 8'h00}; // Example message
        #10 rst = 0; // Release reset
        #10 M = {64'h1234567890ABCDEF, 8'hfa}; // Another message
        #10 M = {64'hFEDCBA9876543210, 8'h00};
        #10 M = {64'hFEDCBA9876543210, 8'hc9}; // Another message
        #10 M = {64'h0F0F0F0F0F0F0F0F, 8'h00}; // Another message
        #10 M = {64'h0F0F0F0F0F0F0F0F, 8'hc3}; // Another message
        #700 $finish; // End simulation
    end

    always #5 clk = ~clk; // Clock generation
    
    initial begin
        $monitor("Time: %0t | Message: %h | CRC: %h", $time, M, CRC_out);
    end
endmodule