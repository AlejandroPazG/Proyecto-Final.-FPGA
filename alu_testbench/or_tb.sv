// ------------------------------------------------------
// Testbench para or_8bit
// ------------------------------------------------------
module or_tb;

  // Señales de prueba
  logic [7:0] A, B;
  logic [7:0] Y;

  // Instancia del DUT (Device Under Test)
  or_8bit dut (
    .A(A),
    .B(B),
    .Y(Y)
  );

  initial begin
    $display("Time\t A\t | B\t = Y");
    $display("-----------------------------");

    A = 8'b00000000; B = 8'b00000000;
    #10 $display("%4t\t %b | %b = %b", $time, A, B, Y);

    A = 8'b11110000; B = 8'b10101010;
    #10 $display("%4t\t %b | %b = %b", $time, A, B, Y);

    A = 8'b00001111; B = 8'b11110000;
    #10 $display("%4t\t %b | %b = %b", $time, A, B, Y);

    A = 8'b01010101; B = 8'b10101010;
    #10 $display("%4t\t %b | %b = %b", $time, A, B, Y);

    $finish;
  end

endmodule
