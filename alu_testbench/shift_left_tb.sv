// ------------------------------------------------------
// Testbench para shift_left_8bit
// ------------------------------------------------------
module shift_left_tb;

  // Señales de prueba
  logic [7:0] A;
  logic [2:0] Shamt;
  logic [7:0] Y;

  // Instancia del DUT (Device Under Test)
  shift_left_8bit dut (
    .A(A),
    .Shamt(Shamt),
    .Y(Y)
  );

  initial begin
    $display("Time\t A\t << Shamt = Y");
    $display("-----------------------------");

    A = 8'b00001111; Shamt = 3'd0;
    #10 $display("%4t\t %b << %0d = %b", $time, A, Shamt, Y);

    A = 8'b00001111; Shamt = 3'd1;
    #10 $display("%4t\t %b << %0d = %b", $time, A, Shamt, Y);

    A = 8'b00001111; Shamt = 3'd2;
    #10 $display("%4t\t %b << %0d = %b", $time, A, Shamt, Y);

    A = 8'b11110000; Shamt = 3'd3;
    #10 $display("%4t\t %b << %0d = %b", $time, A, Shamt, Y);

    A = 8'b10101010; Shamt = 3'd4;
    #10 $display("%4t\t %b << %0d = %b", $time, A, Shamt, Y);

    $finish;
  end

endmodule
