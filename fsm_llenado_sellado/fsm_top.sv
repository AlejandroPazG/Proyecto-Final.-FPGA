// ---------------------------------------------------------------------------
// Módulo: fsm_top
// Descripción: Encapsula y conecta las FSM de llenado (Moore) y de sellado (Mealy).
// Recibe el reloj de 1 Hz y expone las señales de control y de estado.
// ---------------------------------------------------------------------------

module fsm_top (
    input  logic clk,           // Entrada de reloj de 1 Hz
    input  logic rst,           // Señal de reinicio (activo en alto)
    input  logic startfill,     // Señal para iniciar el llenado (desde SW0)
    input  logic productook,    // Señal que indica que hay producto listo (desde SW1)
    output logic llenando,      // Salida que indica que se esta llenando (LED0)
    output logic sellando,      // Salida que indica que se esta sellando (LED1)
    output logic LED,           // Salida que indica que el producto fue sellado (LED2)
    output logic [2:0] state_filler,   // Estado actual de la FSM de llenado (LED3 a LED5)
    output logic [2:0] state_sealer    // Estado actual de la FSM de sellado (LED6 a LED8)
);

    // Señal interna que indica que el llenado ha finalizado
    logic lleno_flag;

    // -----------------------------------------------------------------------
    // Instancia de la FSM tipo Moore: controla el proceso de llenado
    // -----------------------------------------------------------------------
    fsm_moore_filler u_filler (
        .clk(clk),                      // Reloj de 1 Hz
        .rst(rst),                      // Reinicio
        .startfill(startfill),         // Iniciar llenado
        .lleno_flag(lleno_flag),       // Bandera que indica llenado completo
        .llenando(llenando),           // Salida: LED encendido durante el llenado
        .state_indicator(state_filler) // Estado actual de la FSM Moore
    );

    // -----------------------------------------------------------------------
    // Instancia de la FSM tipo Mealy: controla el proceso de sellado
    // -----------------------------------------------------------------------
    fsm_mealy_sealer u_sealer (
        .clk(clk),                      // Reloj de 1 Hz
        .rst(rst),                      // Reinicio
        .lleno_flag(lleno_flag),       // Entrada: indica que el llenado ha terminado
        .productook(productook),       // Entrada: producto listo para ser sellado
        .sellando(sellando),           // Salida: LED encendido durante el sellado
        .LED(LED),                      // Salida: LED encendido cuando el sellado termina
        .state_indicator(state_sealer) // Estado actual de la FSM Mealy
    );

endmodule
