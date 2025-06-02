// ---------------------------------------------------------------------------
// Módulo: top
// Descripción: Módulo principal del diseño.
// Se encarga de recibir las señales físicas desde la placa Basys 3,
// generar el reloj lento (1 Hz) con el prescaler, e instanciar el módulo
// fsm_top que controla el proceso completo de llenado y sellado.
// ---------------------------------------------------------------------------

module top (
    input  logic clk,              // Entrada de reloj principal de la Basys 3 (100 MHz)
    input  logic rst,              // Botón de reinicio (BTN0)
    input  logic startfill,        // Switch que inicia el llenado (SW0)
    input  logic productook,       // Switch que indica que hay producto listo (SW1)
    output logic llenando,         // Salida: LED encendido durante el llenado (LED0)
    output logic sellando,         // Salida: LED encendido durante el sellado (LED1)
    output logic LED,              // Salida: LED encendido cuando el sellado finaliza (LED2)
    output logic [2:0] state_filler, // Salida: estado actual de la FSM de llenado (LED3 a LED5)
    output logic [2:0] state_sealer  // Salida: estado actual de la FSM de sellado (LED6 a LED8)
);

    // Señal interna para el reloj lento (1 Hz) generado por el prescaler
    logic clk_1hz;

    // -----------------------------------------------------------------------
    // Instancia del módulo prescaler:
    // Divide el reloj de 100 MHz a un reloj de 1 Hz para visualizar
    // fácilmente los cambios de estado en la placa
    // -----------------------------------------------------------------------
    prescaler_clk u_prescaler (
        .clk_in(clk),     // Entrada: reloj de 100 MHz
        .reset(rst),      // Entrada: reset general
        .clk_out(clk_1hz) // Salida: reloj lento de 1 Hz
    );

    // -----------------------------------------------------------------------
    // Instancia del módulo fsm_top:
    // Controla todo el proceso de llenado y sellado usando las FSMs internas.
    // Este módulo ya recibe el reloj lento (1 Hz) generado anteriormente.
    // -----------------------------------------------------------------------
    fsm_top u_fsm_top (
        .clk(clk_1hz),                // Entrada: reloj de 1 Hz
        .rst(rst),                    // Entrada: reset
        .startfill(startfill),       // Entrada: señal para iniciar el llenado
        .productook(productook),     // Entrada: señal de producto listo
        .llenando(llenando),         // Salida: LED de llenado
        .sellando(sellando),         // Salida: LED de sellado
        .LED(LED),                    // Salida: LED de producto sellado
        .state_filler(state_filler), // Salida: estado actual de FSM de llenado
        .state_sealer(state_sealer)  // Salida: estado actual de FSM de sellado
    );

endmodule
