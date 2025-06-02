// ------------------------------------------------------
// Testbench para addsub_8bit
// ------------------------------------------------------
module addsub_tb;

  logic [7:0] A, B;
  logic sel;
  logic [7:0] Y;
  logic Cout;

  // Instancia del módulo bajo prueba
  addsub_8bit dut (
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y),
    .Cout(Cout)
  );

  initial begin
    $display("Time\tSel\tA\tB\tY\tCout");
    $display("--------------------------------------------------");

    // Suma: 5 + 3 = 8
    A = 8'd5; B = 8'd3; sel = 0;
    #10 $display("%4t\t%b\t%3d\t%3d\t%3d\t%b", $time, sel, A, B, Y, Cout);

    // Resta: 5 - 3 = 2
    A = 8'd5; B = 8'd3; sel = 1;
    #10 $display("%4t\t%b\t%3d\t%3d\t%3d\t%b", $time, sel, A, B, Y, Cout);

    // Suma: 255 + 1 = 0 (con carry)
    A = 8'd255; B = 8'd1; sel = 0;
    #10 $display("%4t\t%b\t%3d\t%3d\t%3d\t%b", $time, sel, A, B, Y, Cout);

    // Resta: 0 - 1 = 255 (por desbordamiento)
    A = 8'd0; B = 8'd1; sel = 1;
    #10 $display("%4t\t%b\t%3d\t%3d\t%3d\t%b", $time, sel, A, B, Y, Cout);

    $finish;
  end

endmodule

