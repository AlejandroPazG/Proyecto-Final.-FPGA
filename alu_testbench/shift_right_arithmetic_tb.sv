// ----------------------------------------------------
// Testbench para shift_right_arithmetic_8bit
// ----------------------------------------------------
module shift_right_arithmetic_tb;

  // Señales de prueba
  logic [7:0] A;
  logic [2:0] Shamt;
  logic [7:0] Y;

  // Instancia del DUT (Device Under Test)
  shift_right_arithmetic_8bit dut (
    .A(A),
    .Shamt(Shamt),
    .Y(Y)
  );

  // Bloque inicial con pruebas
  initial begin
    $display("Time\tA >>> Shamt = Y");
    $display("---------------------------");

    // Prueba 1: desplazar 1 vez
    A = 8'b11110000; Shamt = 3'd1;
    #10 $display("%4t\t%b >>> %0d = %b", $time, A, Shamt, Y);

    // Prueba 2: desplazar 2 veces
    A = 8'b11110000; Shamt = 3'd2;
    #10 $display("%4t\t%b >>> %0d = %b", $time, A, Shamt, Y);

    // Prueba 3: desplazamiento sin signo
    A = 8'b00111100; Shamt = 3'd2;
    #10 $display("%4t\t%b >>> %0d = %b", $time, A, Shamt, Y);

    // Prueba 4: desplazar 3 veces
    A = 8'b10101010; Shamt = 3'd3;
    #10 $display("%4t\t%b >>> %0d = %b", $time, A, Shamt, Y);

    $finish;
  end

endmodule
