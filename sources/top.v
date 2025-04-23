module top (
    input wire clk,
    input wire cs,                      // Control signal, 0 for CRC-5, 1 for CRC-8
    input wire ed,                      // Encode or Deocde signal, 0 for encode, 1 for decode
    input wire [15:0] CodeWord5,        // Codeword input for CRC-5
    input wire [71:0] CodeWord8,        // Codeword input for CRC-8
    input wire [10:0] DataWordCRC5,     // Data word input for CRC-5
    input wire [63:0] DataWordCRC8,     // Data word input for CRC-8
    output wire [4:0] CRC5,             // CRC output for CRC-5
    output wire [7:0] CRC8,             // CRC output for CRC-8
    output wire error                   // Error flag (if CRC_out is not equal in decode mode)
);

    wire [15:0] CRC5_Message;
    wire [71:0] CRC8_Message;
    wire [4:0] CRC5_out;
    wire [7:0] CRC8_out;

    assign CRC5_Message = ed ? CodeWord5 : {DataWordCRC5, 5'b0};
    assign CRC8_Message = ed ? CodeWord8 : {DataWordCRC8, 8'b0};

    // CRC-5 instance
    CRC_5 CRC5_core (
        .clk(clk),
        .rst(1'b0),
        .M(CRC5_Message),
        .CRC_out(CRC5_out)
    );

    // CRC-8 instance
    CRC_8 CRC8_core (
        .clk(clk),
        .rst(1'b0),
        .M(CRC8_Message),
        .CRC_out(CRC8_out)
    );

    assign CRC5 = cs ? 5'hz : CRC5_out; // Output CRC-5 only when cs is 0
    assign CRC8 = cs ? CRC8_out : 8'hz; // Output CRC-8 only when cs is 1

    // Error detection logic
    assign error = ed && (CRC5 !== 0) && (CRC8 !== 0); // Error if CRC is not zero in decode mode

endmodule
