// alu.v
// 8-bit combinational ALU for FPGA synthesis
// Supports: ADD, SUB, AND, OR, XOR, NOT, INC, DEC, COMPARE (A==B)

module alu8 (
    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] Sel,       // operation select
    output reg [7:0] Result,
    output reg CarryOut,
    output reg Zero
);

    always @(*) begin
        CarryOut = 1'b0;
        Result   = 8'b0;
        Zero     = 1'b0;

        case (Sel)
            4'b0000: {CarryOut, Result} = A + B;       // ADD
            4'b0001: {CarryOut, Result} = A - B;       // SUB
            4'b0010: Result = A & B;                   // AND
            4'b0011: Result = A | B;                   // OR
            4'b0100: Result = A ^ B;                   // XOR
            4'b0101: Result = ~A;                      // NOT
            4'b0110: {CarryOut, Result} = A + 8'b1;   // INC
            4'b0111: {CarryOut, Result} = A - 8'b1;   // DEC
            4'b1000: begin                             // COMPARE A==B
                Result = 8'b0;
                if (A == B)
                    Zero = 1'b1;
            end
            default: Result = 8'b0;
        endcase

        // Set Zero flag if result is zero (except COMPARE already sets it)
        if (Result == 8'b0 && Sel != 4'b1000)
            Zero = 1'b1;
    end

endmodule