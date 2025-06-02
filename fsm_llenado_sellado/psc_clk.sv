`timescale 1ns / 1ps  // Define la unidad de tiempo y precisión para simulación

// ---------------------------------------------------------------------------
// Módulo: prescaler_clk
// Descripción: Divide el reloj de entrada de 100 MHz para generar un reloj lento
// de 1 Hz (un cambio de estado cada segundo). Se utiliza para visualizar mejor
// las transiciones de las FSM en la placa Basys 3.
// ---------------------------------------------------------------------------

module prescaler_clk (
    input  logic clk_in,    // Entrada: reloj principal de la Basys 3 (100 MHz)
    input  logic reset,     // Entrada: reinicio (activo en alto)
    output logic clk_out    // Salida: reloj dividido a 1 Hz
);

    // Cantidad de ciclos necesarios para generar 0.5 segundos con un reloj de 100 MHz
    parameter integer MAX_COUNT = 50_000_000 - 1;

    // Contador de 26 bits (suficiente para contar hasta 67 millones)
    logic [25:0] counter = 0;

    // Registro que mantiene el valor de salida del reloj dividido
    logic clk_reg = 0;

    // Lógica secuencial: se actualiza en cada flanco de subida de clk_in o con reset
    always_ff @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter  <= 0;        // Reinicia el contador
            clk_reg  <= 0;        // Reinicia la salida de reloj
        end else begin
            if (counter == MAX_COUNT) begin
                counter <= 0;           // Reinicia el conteo
                clk_reg <= ~clk_reg;   // Invierte la salida (toggle cada 0.5 s)
            end else begin
                counter <= counter + 1; // Sigue contando
            end
        end
    end

    // Asignación final del reloj dividido a la salida del módulo
    assign clk_out = clk_reg;

endmodule
