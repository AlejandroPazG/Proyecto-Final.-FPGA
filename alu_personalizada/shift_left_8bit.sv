// --------------------------------------------------
// Módulo: shift_left_8bit
// Descripción: Desplazamiento lógico a la izquierda de 8 bits
// Entradas : A (dato a desplazar), Shamt (cantidad de posiciones)
// Salida   : Y (resultado desplazado)
// --------------------------------------------------

module shift_left_8bit (
    input  logic [7:0] A,
    input  logic [2:0] Shamt,  // 3 bits para valores de 0 a 7
    output logic [7:0] Y
);

    always_comb begin
        Y = A << Shamt;
    end

endmodule
