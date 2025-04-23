module top_tb;
    reg clk;
    reg cs;                      // Control signal
    reg ed;                      // Encode or Decode signal, 0 for encode, 1 for decode
    reg [15:0] CodeWord5;        // Codeword input for CRC-5
    reg [71:0] CodeWord8;        // Codeword input for CRC-8
    reg [10:0] DataWordCRC5;     // Data word input for CRC-5
    reg [63:0] DataWordCRC8;     // Data word input for CRC-8
    wire [4:0] CRC5;             // CRC output for CRC-5
    wire [7:0] CRC8;             // CRC output for CRC-8
    wire error;                 // Error flag (if CRC_out is not equal in decode mode)

    // Instantiate the top module
    top uut (
        .clk(clk),
        .ed(ed),
        .cs(cs),
        .CodeWord5(CodeWord5),
        .CodeWord8(CodeWord8),
        .DataWordCRC5(DataWordCRC5),
        .DataWordCRC8(DataWordCRC8),
        .CRC5(CRC5),
        .CRC8(CRC8),
        .error(error)
    );

    initial begin
        clk = 0;
        cs = 0;
        ed = 0;
        CodeWord5 = 0;
        CodeWord8 = 0;
        DataWordCRC8 = 0;
        #5   DataWordCRC5 = 11'h488; // Example data word for CRC-5
        #10  DataWordCRC5 = 11'h677; // Another data word for CRC-5
        #10  DataWordCRC5 = 11'h1AB; // Another data word for CRC-5
        #10  DataWordCRC5 = 11'h1F5; // Another data word for CRC-5
        #200 ed = 1;
        #10  CodeWord5 = 16'h911C;
        #10  CodeWord5 = 16'hCEF5;
        #10  CodeWord5 = 16'hDEF5;
        #10  CodeWord5 = 16'h3561;
        #10  CodeWord5 = 16'h3EAF;
        #200 cs = 1; ed = 0; // Switch to encode mode
        #10  DataWordCRC8 = 64'h1734567FDDCEA101;
        #10  DataWordCRC8 = 64'hF3419826EDAC5729;
        #10  DataWordCRC8 = 64'h963576A64530CD4A; // Another data word for CRC-8
        #10  DataWordCRC8 = 64'hFFFFFFFFFFFFFFFF; // Another data word for CRC-8
        #700 ed = 1;
        #10  CodeWord8 = 72'h1734567FDDCEA10161; // Example codeword for CRC-8
        #10  CodeWord8 = 72'h2734567FDDCEA10161;
        #10  CodeWord8 = 72'hF3419826EDAC572917; // Another codeword for CRC-8
        #10  CodeWord8 = 72'h963576A64530CD4A66; // Another codeword for CRC-8
        #10  CodeWord8 = 72'hFFFFFFFFFFFFFFFFD7; // Another codeword for CRC-8
        #700 $finish; // End simulation
    end

    always #5 clk = ~clk; // Clock generation

    initial begin
        $monitor("Time: %0t | cs: %b | ed: %b | DataWordCRC5: %h | CodeWord5: %h | CRC5: %h | DataWordCRC8: %h | CodeWord8: %h | CRC8: %h | error: %b", 
                 $time, cs, ed, DataWordCRC5, CodeWord5, CRC5, DataWordCRC8, CodeWord8, CRC8, error);
    end

endmodule
