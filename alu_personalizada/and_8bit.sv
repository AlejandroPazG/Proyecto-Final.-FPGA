// ------------------------------------------------------
// Módulo: and_8bit
// Descripción: Operación lógica AND entre dos vectores de 8 bits
// Entradas: A, B
// Salida: Y = A & B
// ------------------------------------------------------
module and_8bit (
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic [7:0] Y
);

    assign Y = A & B;

endmodule
