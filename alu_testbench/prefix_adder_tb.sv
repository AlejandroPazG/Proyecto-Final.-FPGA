// ------------------------------------------------------
// Testbench para prefix_adder_8bit
// ------------------------------------------------------
module prefix_adder_tb;

  // Señales de prueba
  logic [7:0] A, B;
  logic      Cin;
  logic [7:0] Sum;
  logic      Cout;

  // Instancia del DUT (Device Under Test)
  prefix_adder_8bit dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Pruebas
  initial begin
    $display("Time\t A\t + B\t + Cin = Sum\t | Cout");
    $display("------------------------------------------------");

    A = 8'b00000001; B = 8'b00000001; Cin = 0;
    #10 $display("%4t\t %b + %b + %b = %b\t | %b", $time, A, B, Cin, Sum, Cout);

    A = 8'b00000010; B = 8'b00000001; Cin = 0;
    #10 $display("%4t\t %b + %b + %b = %b\t | %b", $time, A, B, Cin, Sum, Cout);

    A = 8'b11111111; B = 8'b00000001; Cin = 0;
    #10 $display("%4t\t %b + %b + %b = %b\t | %b", $time, A, B, Cin, Sum, Cout);

    A = 8'b10101010; B = 8'b01010101; Cin = 1;
    #10 $display("%4t\t %b + %b + %b = %b\t | %b", $time, A, B, Cin, Sum, Cout);

    $finish;
  end

endmodule
