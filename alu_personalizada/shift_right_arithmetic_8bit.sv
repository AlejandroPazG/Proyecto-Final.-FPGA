// ---------------------------------------------
// Módulo: shift_right_arithmetic_8bit
// Descripción: Realiza un desplazamiento aritmético a la derecha
// Entradas: A (dato a desplazar), Shamt (número de bits)
// Salida: Y (resultado)
// ---------------------------------------------

module shift_right_arithmetic_8bit (
    input  logic [7:0] A,
    input  logic [2:0] Shamt,
    output logic [7:0] Y
);

    // Asignación de desplazamiento aritmético
    assign Y = $signed(A) >>> Shamt;

endmodule
