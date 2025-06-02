// -------------------------------------------
// Módulo principal de la ALU de 8 bits
// -------------------------------------------
// Entradas : A, B (operandos), sel (selección de operación)
// Salidas  : Y (resultado), Cout (carry out)
// Operaciones:
// sel = 000 -> A + B
// sel = 001 -> A - B
// sel = 010 -> A & B
// sel = 011 -> A | B
// sel = 100 -> A << B (shift left lógico)
// sel = 101 -> A >>> B (shift right aritmético)
// -------------------------------------------
module alu_top_8bit (
    input  logic [7:0] A, B,        //operandos de 8 bits
    input  logic [2:0] sel,         //selector de operacion de 3 bits
    output logic [7:0] Y,           //resutaldo de operacion
    output logic       Cout         //carry de salida, 
);

    // Señales internas para resultados de cada operación
    logic [7:0] sum_out, and_out, or_out, shl_out, shr_out;
    logic       cout_sum;

    // Instancia del módulo suma/resta 
    addsub_8bit u_addsub (
        .A    (A),          //operando A
        .B    (B),          //operando B
        .Sel  (sel[0]),     //lsb del selector para determinar suma o reta
        .Y    (sum_out),    //resultado de suma o resta
        .Cout (cout_sum)    //carry de salida
    );

    // Instancia del módulo AND
    and_8bit u_and (
        .A (A),             //operandos
        .B (B),
        .Y (and_out)        //resultado de A & B
    );

    // Instancia del módulo OR
    or_8bit u_or (
        .A (A),             //operandos
        .B (B),
        .Y (or_out)         //resultado de A | B
    );

    // Instancia del módulo SHIFT LEFT
    shift_left_8bit u_shl (
        .A     (A),
        .Shamt (B[2:0]),  // Tomamos solo 3 bits para el desplazamiento
        .Y     (shl_out)
    );

    // Instancia del módulo SHIFT RIGHT ARITHMETIC
    shift_right_arithmetic_8bit u_shr (
        .A     (A),         //valor a desplazar
        .Shamt (B[2:0]),    //3 bits para el desplazamiento
        .Y     (shr_out)    //reesultado
    );

    // Lógica de selección con MUX
    always_comb begin
        case (sel)
            3'b000, 3'b001: begin       //para suma o resta
                Y    = sum_out;
                Cout = cout_sum;
            end
            3'b010: begin               //para AND
                Y    = and_out;
                Cout = 0;
            end
            3'b011: begin               //para OR
                Y    = or_out;
                Cout = 0;
            end
            3'b100: begin               //shift left
                Y    = shl_out;
                Cout = 0;
            end
            3'b101: begin               //shif right aritmetico
                Y    = shr_out;
                Cout = 0;
            end
            default: begin
                Y    = 8'b0;            //valor por defecto en caso se leccion invalida
                Cout = 0;
            end
        endcase
    end

endmodule