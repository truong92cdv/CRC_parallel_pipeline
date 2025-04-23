module CRC_5 #(
    parameter k = 5,                    // Number of bits in the CRC
    parameter N = 11,                   // Number of bits in the message
    parameter CRC_POLY = 5'b00101       // CRC polynomial for CRC-5: x^5 + x^2 + 1
)(
    input wire clk,
    input wire rst,
    input wire [N+k-1:0] M,             // Message input
    output wire [k-1:0] CRC_out
);
    localparam POLY_0s = 5'b00000;      // Polynomial with all zeros

    // pipeline registers for CRC calculation
    reg [N+k-2:0] reg_stage_1;
    reg [N+k-3:0] reg_stage_2;
    reg [N+k-4:0] reg_stage_3;
    reg [N+k-5:0] reg_stage_4;
    reg [N+k-6:0] reg_stage_5;
    reg [N+k-7:0] reg_stage_6;
    reg [N+k-8:0] reg_stage_7;
    reg [N+k-9:0] reg_stage_8;
    reg [N+k-10:0] reg_stage_9;
    reg [N+k-11:0] reg_stage_10;

    // CRC calculation pipeline
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_stage_1 <= 0;
            reg_stage_2 <= 0;
            reg_stage_3 <= 0;
            reg_stage_4 <= 0;
            reg_stage_5 <= 0;
            reg_stage_6 <= 0;
            reg_stage_7 <= 0;
            reg_stage_8 <= 0;
            reg_stage_9 <= 0;
            reg_stage_10 <= 0;
        end else begin
            reg_stage_1  <= {          M[N+k-2:N-1]   ^ (          M[N+k-1]  ? CRC_POLY : POLY_0s),           M[N-2:0]};
            reg_stage_2  <= {reg_stage_1[N+k-3:N-2]   ^ (reg_stage_1[N+k-2]  ? CRC_POLY : POLY_0s), reg_stage_1[N-3:0]};
            reg_stage_3  <= {reg_stage_2[N+k-4:N-3]   ^ (reg_stage_2[N+k-3]  ? CRC_POLY : POLY_0s), reg_stage_2[N-4:0]};
            reg_stage_4  <= {reg_stage_3[N+k-5:N-4]   ^ (reg_stage_3[N+k-4]  ? CRC_POLY : POLY_0s), reg_stage_3[N-5:0]};
            reg_stage_5  <= {reg_stage_4[N+k-6:N-5]   ^ (reg_stage_4[N+k-5]  ? CRC_POLY : POLY_0s), reg_stage_4[N-6:0]};
            reg_stage_6  <= {reg_stage_5[N+k-7:N-6]   ^ (reg_stage_5[N+k-6]  ? CRC_POLY : POLY_0s), reg_stage_5[N-7:0]};
            reg_stage_7  <= {reg_stage_6[N+k-8:N-7]   ^ (reg_stage_6[N+k-7]  ? CRC_POLY : POLY_0s), reg_stage_6[N-8:0]};
            reg_stage_8  <= {reg_stage_7[N+k-9:N-8]   ^ (reg_stage_7[N+k-8]  ? CRC_POLY : POLY_0s), reg_stage_7[N-9:0]};
            reg_stage_9  <= {reg_stage_8[N+k-10:N-9]  ^ (reg_stage_8[N+k-9]  ? CRC_POLY : POLY_0s), reg_stage_8[N-10:0]};
            reg_stage_10 <= {reg_stage_9[N+k-11:N-10] ^ (reg_stage_9[N+k-10] ? CRC_POLY : POLY_0s), reg_stage_9[N-11:0]};
        end
    end

    assign CRC_out = {reg_stage_10[N+k-12:0] ^ (reg_stage_10[N+k-11] ? CRC_POLY : POLY_0s)};

endmodule