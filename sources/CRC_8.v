module CRC_8 #(
    parameter k = 8,                    // Number of bits in the CRC
    parameter N = 64,                   // Number of bits in the message
    parameter CRC_POLY = 8'b00000111    // CRC polynomial for CRC-8: x^8 + x^2 + x + 1
)(
    input wire clk,
    input wire rst,
    input wire [N+k-1:0] M,             // Message input
    output wire [k-1:0] CRC_out
);
    localparam POLY_0s = 8'b00000000;   // Polynomial with all zeros
    
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
    reg [N+k-12:0] reg_stage_11;
    reg [N+k-13:0] reg_stage_12;
    reg [N+k-14:0] reg_stage_13;
    reg [N+k-15:0] reg_stage_14;
    reg [N+k-16:0] reg_stage_15;
    reg [N+k-17:0] reg_stage_16;
    reg [N+k-18:0] reg_stage_17;
    reg [N+k-19:0] reg_stage_18;
    reg [N+k-20:0] reg_stage_19;
    reg [N+k-21:0] reg_stage_20;
    reg [N+k-22:0] reg_stage_21;
    reg [N+k-23:0] reg_stage_22;
    reg [N+k-24:0] reg_stage_23;
    reg [N+k-25:0] reg_stage_24;
    reg [N+k-26:0] reg_stage_25;
    reg [N+k-27:0] reg_stage_26;
    reg [N+k-28:0] reg_stage_27;
    reg [N+k-29:0] reg_stage_28;
    reg [N+k-30:0] reg_stage_29;
    reg [N+k-31:0] reg_stage_30;
    reg [N+k-32:0] reg_stage_31;
    reg [N+k-33:0] reg_stage_32;
    reg [N+k-34:0] reg_stage_33;
    reg [N+k-35:0] reg_stage_34;
    reg [N+k-36:0] reg_stage_35;
    reg [N+k-37:0] reg_stage_36;
    reg [N+k-38:0] reg_stage_37;
    reg [N+k-39:0] reg_stage_38;
    reg [N+k-40:0] reg_stage_39;
    reg [N+k-41:0] reg_stage_40;
    reg [N+k-42:0] reg_stage_41;
    reg [N+k-43:0] reg_stage_42;
    reg [N+k-44:0] reg_stage_43;
    reg [N+k-45:0] reg_stage_44;
    reg [N+k-46:0] reg_stage_45;
    reg [N+k-47:0] reg_stage_46;
    reg [N+k-48:0] reg_stage_47;
    reg [N+k-49:0] reg_stage_48;
    reg [N+k-50:0] reg_stage_49;
    reg [N+k-51:0] reg_stage_50;
    reg [N+k-52:0] reg_stage_51;
    reg [N+k-53:0] reg_stage_52;
    reg [N+k-54:0] reg_stage_53;
    reg [N+k-55:0] reg_stage_54;
    reg [N+k-56:0] reg_stage_55;
    reg [N+k-57:0] reg_stage_56;
    reg [N+k-58:0] reg_stage_57;
    reg [N+k-59:0] reg_stage_58;
    reg [N+k-60:0] reg_stage_59;
    reg [N+k-61:0] reg_stage_60;
    reg [N+k-62:0] reg_stage_61;
    reg [N+k-63:0] reg_stage_62;
    reg [N+k-64:0] reg_stage_63;

    // CRC calculation pipeline
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_stage_1  <= 0;
            reg_stage_2  <= 0;
            reg_stage_3  <= 0;
            reg_stage_4  <= 0;
            reg_stage_5  <= 0;
            reg_stage_6  <= 0;
            reg_stage_7  <= 0;
            reg_stage_8  <= 0;
            reg_stage_9  <= 0;
            reg_stage_10 <= 0;
            reg_stage_11 <= 0;
            reg_stage_12 <= 0;
            reg_stage_13 <= 0;
            reg_stage_14 <= 0;
            reg_stage_15 <= 0;
            reg_stage_16 <= 0;
            reg_stage_17 <= 0;
            reg_stage_18 <= 0;
            reg_stage_19 <= 0;
            reg_stage_20 <= 0;
            reg_stage_21 <= 0;
            reg_stage_22 <= 0;
            reg_stage_23 <= 0;
            reg_stage_24 <= 0;
            reg_stage_25 <= 0;
            reg_stage_26 <= 0;
            reg_stage_27 <= 0;
            reg_stage_28 <= 0;
            reg_stage_29 <= 0;
            reg_stage_30 <= 0;
            reg_stage_31 <= 0;
            reg_stage_32 <= 0;
            reg_stage_33 <= 0;
            reg_stage_34 <= 0;
            reg_stage_35 <= 0;
            reg_stage_36 <= 0;
            reg_stage_37 <= 0;
            reg_stage_38 <= 0;
            reg_stage_39 <= 0;
            reg_stage_40 <= 0;
            reg_stage_41 <= 0;
            reg_stage_42 <= 0;
            reg_stage_43 <= 0;
            reg_stage_44 <= 0;
            reg_stage_45 <= 0;
            reg_stage_46 <= 0;
            reg_stage_47 <= 0;
            reg_stage_48 <= 0;
            reg_stage_49 <= 0;
            reg_stage_50 <= 0;
            reg_stage_51 <= 0;
            reg_stage_52 <= 0;
            reg_stage_53 <= 0;
            reg_stage_54 <= 0;
            reg_stage_55 <= 0;
            reg_stage_56 <= 0;
            reg_stage_57 <= 0;
            reg_stage_58 <= 0;
            reg_stage_59 <= 0;
            reg_stage_60 <= 0;
            reg_stage_61 <= 0;
            reg_stage_62 <= 0;
            reg_stage_63 <= 0;
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
            reg_stage_10 <= {reg_stage_9[N+k-11:N-10]   ^ (reg_stage_9[N+k-10]  ? CRC_POLY : POLY_0s),  reg_stage_9[N-11:0]};
            reg_stage_11 <= {reg_stage_10[N+k-12:N-11]  ^ (reg_stage_10[N+k-11] ? CRC_POLY : POLY_0s),  reg_stage_10[N-12:0]};
            reg_stage_12 <= {reg_stage_11[N+k-13:N-12]  ^ (reg_stage_11[N+k-12] ? CRC_POLY : POLY_0s),  reg_stage_11[N-13:0]};
            reg_stage_13 <= {reg_stage_12[N+k-14:N-13]  ^ (reg_stage_12[N+k-13] ? CRC_POLY : POLY_0s),  reg_stage_12[N-14:0]};
            reg_stage_14 <= {reg_stage_13[N+k-15:N-14]  ^ (reg_stage_13[N+k-14] ? CRC_POLY : POLY_0s),  reg_stage_13[N-15:0]};
            reg_stage_15 <= {reg_stage_14[N+k-16:N-15]  ^ (reg_stage_14[N+k-15] ? CRC_POLY : POLY_0s),  reg_stage_14[N-16:0]};
            reg_stage_16 <= {reg_stage_15[N+k-17:N-16]  ^ (reg_stage_15[N+k-16] ? CRC_POLY : POLY_0s),  reg_stage_15[N-17:0]};
            reg_stage_17 <= {reg_stage_16[N+k-18:N-17]  ^ (reg_stage_16[N+k-17] ? CRC_POLY : POLY_0s),  reg_stage_16[N-18:0]};
            reg_stage_18 <= {reg_stage_17[N+k-19:N-18]  ^ (reg_stage_17[N+k-18] ? CRC_POLY : POLY_0s),  reg_stage_17[N-19:0]};
            reg_stage_19 <= {reg_stage_18[N+k-20:N-19]  ^ (reg_stage_18[N+k-19] ? CRC_POLY : POLY_0s),  reg_stage_18[N-20:0]};
            reg_stage_20 <= {reg_stage_19[N+k-21:N-20]  ^ (reg_stage_19[N+k-20] ? CRC_POLY : POLY_0s),  reg_stage_19[N-21:0]};
            reg_stage_21 <= {reg_stage_20[N+k-22:N-21]  ^ (reg_stage_20[N+k-21] ? CRC_POLY : POLY_0s),  reg_stage_20[N-22:0]};
            reg_stage_22 <= {reg_stage_21[N+k-23:N-22]  ^ (reg_stage_21[N+k-22] ? CRC_POLY : POLY_0s),  reg_stage_21[N-23:0]};
            reg_stage_23 <= {reg_stage_22[N+k-24:N-23]  ^ (reg_stage_22[N+k-23] ? CRC_POLY : POLY_0s),  reg_stage_22[N-24:0]};
            reg_stage_24 <= {reg_stage_23[N+k-25:N-24]  ^ (reg_stage_23[N+k-24] ? CRC_POLY : POLY_0s),  reg_stage_23[N-25:0]};
            reg_stage_25 <= {reg_stage_24[N+k-26:N-25]  ^ (reg_stage_24[N+k-25] ? CRC_POLY : POLY_0s),  reg_stage_24[N-26:0]};
            reg_stage_26 <= {reg_stage_25[N+k-27:N-26]  ^ (reg_stage_25[N+k-26] ? CRC_POLY : POLY_0s),  reg_stage_25[N-27:0]};
            reg_stage_27 <= {reg_stage_26[N+k-28:N-27]  ^ (reg_stage_26[N+k-27] ? CRC_POLY : POLY_0s),  reg_stage_26[N-28:0]};
            reg_stage_28 <= {reg_stage_27[N+k-29:N-28]  ^ (reg_stage_27[N+k-28] ? CRC_POLY : POLY_0s),  reg_stage_27[N-29:0]};
            reg_stage_29 <= {reg_stage_28[N+k-30:N-29]  ^ (reg_stage_28[N+k-29] ? CRC_POLY : POLY_0s),  reg_stage_28[N-30:0]};
            reg_stage_30 <= {reg_stage_29[N+k-31:N-30]  ^ (reg_stage_29[N+k-30] ? CRC_POLY : POLY_0s),  reg_stage_29[N-31:0]};
            reg_stage_31 <= {reg_stage_30[N+k-32:N-31]  ^ (reg_stage_30[N+k-31] ? CRC_POLY : POLY_0s),  reg_stage_30[N-32:0]};
            reg_stage_32 <= {reg_stage_31[N+k-33:N-32]  ^ (reg_stage_31[N+k-32] ? CRC_POLY : POLY_0s),  reg_stage_31[N-33:0]};
            reg_stage_33 <= {reg_stage_32[N+k-34:N-33]  ^ (reg_stage_32[N+k-33] ? CRC_POLY : POLY_0s),  reg_stage_32[N-34:0]};
            reg_stage_34 <= {reg_stage_33[N+k-35:N-34]  ^ (reg_stage_33[N+k-34] ? CRC_POLY : POLY_0s),  reg_stage_33[N-35:0]};
            reg_stage_35 <= {reg_stage_34[N+k-36:N-35]  ^ (reg_stage_34[N+k-35] ? CRC_POLY : POLY_0s),  reg_stage_34[N-36:0]};
            reg_stage_36 <= {reg_stage_35[N+k-37:N-36]  ^ (reg_stage_35[N+k-36] ? CRC_POLY : POLY_0s),  reg_stage_35[N-37:0]};
            reg_stage_37 <= {reg_stage_36[N+k-38:N-37]  ^ (reg_stage_36[N+k-37] ? CRC_POLY : POLY_0s),  reg_stage_36[N-38:0]};
            reg_stage_38 <= {reg_stage_37[N+k-39:N-38]  ^ (reg_stage_37[N+k-38] ? CRC_POLY : POLY_0s),  reg_stage_37[N-39:0]};
            reg_stage_39 <= {reg_stage_38[N+k-40:N-39]  ^ (reg_stage_38[N+k-39] ? CRC_POLY : POLY_0s),  reg_stage_38[N-40:0]};
            reg_stage_40 <= {reg_stage_39[N+k-41:N-40]  ^ (reg_stage_39[N+k-40] ? CRC_POLY : POLY_0s),  reg_stage_39[N-41:0]};
            reg_stage_41 <= {reg_stage_40[N+k-42:N-41]  ^ (reg_stage_40[N+k-41] ? CRC_POLY : POLY_0s),  reg_stage_40[N-42:0]};
            reg_stage_42 <= {reg_stage_41[N+k-43:N-42]  ^ (reg_stage_41[N+k-42] ? CRC_POLY : POLY_0s),  reg_stage_41[N-43:0]};
            reg_stage_43 <= {reg_stage_42[N+k-44:N-43]  ^ (reg_stage_42[N+k-43] ? CRC_POLY : POLY_0s),  reg_stage_42[N-44:0]};
            reg_stage_44 <= {reg_stage_43[N+k-45:N-44]  ^ (reg_stage_43[N+k-44] ? CRC_POLY : POLY_0s),  reg_stage_43[N-45:0]};
            reg_stage_45 <= {reg_stage_44[N+k-46:N-45]  ^ (reg_stage_44[N+k-45] ? CRC_POLY : POLY_0s),  reg_stage_44[N-46:0]};
            reg_stage_46 <= {reg_stage_45[N+k-47:N-46]  ^ (reg_stage_45[N+k-46] ? CRC_POLY : POLY_0s),  reg_stage_45[N-47:0]};
            reg_stage_47 <= {reg_stage_46[N+k-48:N-47]  ^ (reg_stage_46[N+k-47] ? CRC_POLY : POLY_0s),  reg_stage_46[N-48:0]};
            reg_stage_48 <= {reg_stage_47[N+k-49:N-48]  ^ (reg_stage_47[N+k-48] ? CRC_POLY : POLY_0s),  reg_stage_47[N-49:0]};
            reg_stage_49 <= {reg_stage_48[N+k-50:N-49]  ^ (reg_stage_48[N+k-49] ? CRC_POLY : POLY_0s),  reg_stage_48[N-50:0]};
            reg_stage_50 <= {reg_stage_49[N+k-51:N-50]  ^ (reg_stage_49[N+k-50] ? CRC_POLY : POLY_0s),  reg_stage_49[N-51:0]};
            reg_stage_51 <= {reg_stage_50[N+k-52:N-51]  ^ (reg_stage_50[N+k-51] ? CRC_POLY : POLY_0s),  reg_stage_50[N-52:0]};
            reg_stage_52 <= {reg_stage_51[N+k-53:N-52]  ^ (reg_stage_51[N+k-52] ? CRC_POLY : POLY_0s),  reg_stage_51[N-53:0]};
            reg_stage_53 <= {reg_stage_52[N+k-54:N-53]  ^ (reg_stage_52[N+k-53] ? CRC_POLY : POLY_0s),  reg_stage_52[N-54:0]};
            reg_stage_54 <= {reg_stage_53[N+k-55:N-54]  ^ (reg_stage_53[N+k-54] ? CRC_POLY : POLY_0s),  reg_stage_53[N-55:0]};
            reg_stage_55 <= {reg_stage_54[N+k-56:N-55]  ^ (reg_stage_54[N+k-55] ? CRC_POLY : POLY_0s),  reg_stage_54[N-56:0]};
            reg_stage_56 <= {reg_stage_55[N+k-57:N-56]  ^ (reg_stage_55[N+k-56] ? CRC_POLY : POLY_0s),  reg_stage_55[N-57:0]};
            reg_stage_57 <= {reg_stage_56[N+k-58:N-57]  ^ (reg_stage_56[N+k-57] ? CRC_POLY : POLY_0s),  reg_stage_56[N-58:0]};
            reg_stage_58 <= {reg_stage_57[N+k-59:N-58]  ^ (reg_stage_57[N+k-58] ? CRC_POLY : POLY_0s),  reg_stage_57[N-59:0]};
            reg_stage_59 <= {reg_stage_58[N+k-60:N-59]  ^ (reg_stage_58[N+k-59] ? CRC_POLY : POLY_0s),  reg_stage_58[N-60:0]};
            reg_stage_60 <= {reg_stage_59[N+k-61:N-60]  ^ (reg_stage_59[N+k-60] ? CRC_POLY : POLY_0s),  reg_stage_59[N-61:0]};
            reg_stage_61 <= {reg_stage_60[N+k-62:N-61]  ^ (reg_stage_60[N+k-61] ? CRC_POLY : POLY_0s),  reg_stage_60[N-62:0]};
            reg_stage_62 <= {reg_stage_61[N+k-63:N-62]  ^ (reg_stage_61[N+k-62] ? CRC_POLY : POLY_0s),  reg_stage_61[N-63:0]};
            reg_stage_63 <= {reg_stage_62[N+k-64:N-63]  ^ (reg_stage_62[N+k-63] ? CRC_POLY : POLY_0s),  reg_stage_62[N-64:0]};
        end
    end

    assign CRC_out = {reg_stage_63[N+k-65:0] ^ (reg_stage_63[N+k-64] ? CRC_POLY : POLY_0s)};
    
endmodule