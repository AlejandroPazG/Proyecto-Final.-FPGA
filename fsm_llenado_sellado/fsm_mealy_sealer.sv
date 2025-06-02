// ---------------------------------------------------------------------------
// Módulo: fsm_mealy_sealer
// Descripción: Implementa una máquina de estados tipo Mealy que controla
// el proceso de sellado de botellas.
// La salida depende del estado actual y de las entradas (característica Mealy).
// ---------------------------------------------------------------------------

module fsm_mealy_sealer (
    input  logic clk, rst,                // clk: reloj de 1 Hz, rst: reinicio global
    input  logic lleno_flag,             // Entrada que indica que el llenado ha finalizado
    input  logic productook,             // Entrada que indica que hay producto listo para sellar
    output logic sellando,               // Salida activa mientras se está sellando (LED1)
    output logic LED,                    // Salida que indica que el sellado ha finalizado (LED2)
    output logic [2:0] state_indicator   // Salida que representa el estado actual (para LEDs)
);

    // Definición del tipo enumerado para los estados de la FSM
    typedef enum logic [2:0] {
        IDLE,           // Espera a que lleno_flag sea 1
        CHECK_BOTTLE,   // Verifica si hay producto listo
        FILLING,        // Simula el proceso de sellado
        SEALING,        // Finaliza el sellado
        DONE            // Estado de cierre antes de reiniciar
    } state_t;

    // Variables de estado actual y próximo estado
    state_t state, next_state;

    // Lógica secuencial: actualización del estado con el reloj o reinicio
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;           // Reinicia al estado inicial
        else
            state <= next_state;     // Avanza al siguiente estado
    end

    // Lógica combinacional: define las transiciones de estado
    always_comb begin
        next_state = state;          // Valor por defecto: mantenerse en el mismo estado
        case (state)
            IDLE:          next_state = (lleno_flag) ? CHECK_BOTTLE : IDLE;       // Espera a que termine el llenado
            CHECK_BOTTLE:  next_state = (productook) ? FILLING : CHECK_BOTTLE;    // Avanza si hay producto
            FILLING:       next_state = (productook) ? SEALING : FILLING;         // Avanza si aún hay producto
            SEALING:       next_state = DONE;                                     // Finaliza sellado
            DONE:          next_state = IDLE;                                     // Reinicia ciclo
            default:       next_state = IDLE;                                     // Valor de seguridad
        endcase
    end

    // Lógica de salida tipo Mealy: depende del estado actual y las entradas
    always_comb begin
        sellando = (state == FILLING && productook);  // LED1 encendido mientras se está sellando
        LED      = (state == SEALING);                // LED2 encendido cuando se completa el sellado
    end

    // Salida visual del estado actual para mostrarlo con LEDs
    assign state_indicator = state;

endmodule
