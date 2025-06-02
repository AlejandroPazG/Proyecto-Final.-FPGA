// ---------------------------------------------------
// Testbench para alu_top_8bit
// ---------------------------------------------------

module alu_top_tb;

  // Señales de prueba
  logic [7:0] A, B;
  logic [2:0] sel;
  logic [7:0] Y;
  logic       Cout;

  // Instancia del módulo bajo prueba
  alu_top_8bit dut (
    .A   (A),
    .B   (B),
    .sel (sel),
    .Y   (Y),
    .Cout(Cout)
  );

  // Bloque inicial con pruebas
  initial begin
    $display("Time\tSel\tA\tB\tY\tCout");
    $display("---------------------------------------------------");

    // Prueba 1: A + B
    A = 8'd5;  B = 8'd3;  sel = 3'b000;
    #10 $display("%4t\t%b\t%d\t%d\t%d\t%b", $time, sel, A, B, Y, Cout);

    // Prueba 2: A - B
    A = 8'd5;  B = 8'd3;  sel = 3'b001;
    #10 $display("%4t\t%b\t%d\t%d\t%d\t%b", $time, sel, A, B, Y, Cout);

    // Prueba 3: A & B
    A = 8'b11001100; B = 8'b10101010; sel = 3'b010;
    #10 $display("%4t\t%b\t%b\t%b\t%b\t%b", $time, sel, A, B, Y, Cout);

    // Prueba 4: A | B
    A = 8'b11001100; B = 8'b10101010; sel = 3'b011;
    #10 $display("%4t\t%b\t%b\t%b\t%b\t%b", $time, sel, A, B, Y, Cout);

    // Prueba 5: Shift left
    A = 8'b00001111; B = 8'b00000010; sel = 3'b100;
    #10 $display("%4t\t%b\t%b\t%b\t%b\t%b", $time, sel, A, B, Y, Cout);

    // Prueba 6: Shift right aritmético
    A = 8'b11110000; B = 8'b00000011; sel = 3'b101;
    #10 $display("%4t\t%b\t%b\t%b\t%b\t%b", $time, sel, A, B, Y, Cout);

    $finish;
  end

endmodule
