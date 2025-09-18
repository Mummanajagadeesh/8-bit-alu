// alu_tb.v
`timescale 1ns / 1ps

module alu_tb;

    // Inputs to ALU
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] Sel;

    // Outputs from ALU
    wire [7:0] Result;
    wire CarryOut;
    wire Zero;

    // Instantiate the ALU
    alu8 uut (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Result(Result),
        .CarryOut(CarryOut),
        .Zero(Zero)
    );

    initial begin
        $display("Time  Sel   A    B   => Result  Carry Zero");

        // ADD
        A = 8'h0A; B = 8'h05; Sel = 4'b0000; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // SUB
        A = 8'h05; B = 8'h0A; Sel = 4'b0001; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // AND
        A = 8'hF0; B = 8'h0F; Sel = 4'b0010; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // OR
        A = 8'hF0; B = 8'h0F; Sel = 4'b0011; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // XOR
        A = 8'hAA; B = 8'h55; Sel = 4'b0100; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // NOT
        A = 8'hFF; B = 8'h00; Sel = 4'b0101; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // INC
        A = 8'h7F; B = 8'h00; Sel = 4'b0110; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // DEC
        A = 8'h00; B = 8'h00; Sel = 4'b0111; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        // COMPARE
        A = 8'h5A; B = 8'h5A; Sel = 4'b1000; #10;
        $display("%0t  %b  %h  %h => %h  %b   %b", $time, Sel, A, B, Result, CarryOut, Zero);

        #10 $finish;
    end

endmodule
