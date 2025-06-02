// ----------------------------------------------------------
// Módulo: addsub_8bit
// Descripción: Suma o resta A y B según el valor de Sel
//              Sel = 0 → A + B
//              Sel = 1 → A - B (A + complemento de B + 1)
// Usa internamente el módulo prefix_adder_8bit
// ----------------------------------------------------------
module addsub_8bit (
    input  logic [7:0] A,       //operando a
    input  logic [7:0] B,       //operando b
    input  logic       Sel,    // 0 = suma, 1 = resta
    output logic [7:0] Y,       //resultado de la operacion
    output logic       Cout     //carry de salida
);

    logic [7:0] B_mux;          //resultado del mux
    logic       Cin;            //carry de entrada

    // Si Sel = 0, se deja B tal cual (suma)
    // Si Sel = 1, se invierte B y se suma 1 (resta)
    assign B_mux = Sel ? ~B : B;        //operador para seleccionar entre B o su complemento
    assign Cin   = Sel;                 //si sel es 1 se suma 1 adicoinal para la resta por complemento a 2

    // Instancia del sumador prefix
    prefix_adder_8bit adder (
        .A(A),              //entrada A
        .B(B_mux),          //entrada b segun la operacion
        .Cin(Cin),          //carry de entrada
        .Sum(Y),            //resultado
        .Cout(Cout)         //carry de salida
    );

endmodule
