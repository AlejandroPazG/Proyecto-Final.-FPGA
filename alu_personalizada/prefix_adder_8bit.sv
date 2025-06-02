// ------------------------------------------------------
// Módulo: prefix_adder_8bit
// Descripción: Sumador tipo Prefix de 8 bits
// Entradas: A, B, Cin (carry de entrada)
// Salidas: Sum (8 bits), Cout (carry de salida)
// ------------------------------------------------------
module prefix_adder_8bit (
    input  logic [7:0] A,    // Operando A
    input  logic [7:0] B,    // Operando B
    input  logic       Cin,  // Carry de entrada
    output logic [7:0] Sum,  // Resultado de la suma
    output logic       Cout  // Carry de salida
);

    logic [7:0] G, P;       //G se;ales de generacion y P de propagación
    logic [8:0] C;          //se;ales de acarreo internas 

    assign G = A & B;       //genera se;al si A y B son 1
    assign P = A ^ B;       //se;al propagete es la xor, si se puede propagar el carry
    assign C[0] = Cin;      //primer carry de entrada

    genvar i;
    generate        //para cada bit del sumador de 0 a 7
        for (i = 0; i < 8; i++) begin
                    //se calcula el carry
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate

    assign Sum = P ^ C[7:0];        //resultado final de la suma
    assign Cout = C[8];             //ultimo carry de salida

endmodule
