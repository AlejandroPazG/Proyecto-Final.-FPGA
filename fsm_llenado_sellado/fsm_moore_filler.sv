// ---------------------------------------------------------------------------
// Módulo: fsm_moore_filler
// Descripción: Implementa una máquina de estados finitos tipo Moore que controla
// el proceso de llenado automático de botellas.
// La salida depende solo del estado actual, no de las entradas.
// ---------------------------------------------------------------------------

module fsm_moore_filler (
    input  logic clk, rst, startfill,        // clk: reloj de 1 Hz, rst: reinicio global, startfill: activar llenado
    output logic lleno_flag,                 // Salida que indica que el llenado se ha completado
    output logic llenando,                   // Salida activa durante el estado de llenado
    output logic [2:0] state_indicator       // Salida que representa el estado actual (para LEDs)
);

    // Definición del tipo de dato enumerado para los estados
    typedef enum logic [2:0] {
        IDLE,          // Estado de reposo (espera a que startfill sea 1)
        CHECK_SENSOR,  // Simula detección de botella (sensor siempre en 1)
        FILLING,       // Activa el llenado
        SEALING,       // Estado intermedio antes de finalizar
        DONE           // Llenado finalizado, activa lleno_flag
    } state_t;

    // Variables que almacenan el estado actual y el siguiente estado
    state_t state, next_state;

    // Lógica secuencial: actualiza el estado en cada flanco de reloj o al hacer reset
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;           // Si hay reset, volver al estado inicial
        else
            state <= next_state;     // Avanzar al siguiente estado
    end

    // Lógica combinacional: determina las transiciones entre estados
    always_comb begin
        next_state = state;          // Valor por defecto: mantenerse en el estado actual
        case (state)
            IDLE:          next_state = (startfill) ? CHECK_SENSOR : IDLE;  // Espera a que se active startfill
            CHECK_SENSOR:  next_state = FILLING;                            // Simula que el sensor detecta botella
            FILLING:       next_state = SEALING;                            // Llenado completado, avanzar
            SEALING:       next_state = DONE;                               // Prepararse para finalizar
            DONE:          next_state = IDLE;                               // Reiniciar el ciclo
            default:       next_state = IDLE;                               // Valor por defecto de seguridad
        endcase
    end

    // Lógica de salida tipo Moore: depende solo del estado actual
    always_comb begin
        lleno_flag = (state == DONE);      // Activa bandera al llegar a DONE
        llenando   = (state == FILLING);   // Activa salida de llenado solo en ese estado
    end

    // Asignación del estado actual a la salida visual (LEDs)
    assign state_indicator = state;

endmodule
