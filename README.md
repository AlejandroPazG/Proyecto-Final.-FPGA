#  Proyecto Final - ALU y FSM en FPGA (Basys 3)

Este repositorio contiene los archivos, módulos y demostraciones correspondientes al proyecto final de programación en FPGA con **SystemVerilog**, simulados y probados en la placa **Basys 3**. Se presentan dos sistemas independientes: una **ALU personalizada** y una **máquina de estados finita (FSM)** que simula el proceso de llenado y sellado de botellas.

---

##  1. ALU Personalizada de 8 Bits

###  Carpeta: `alu_personalizada/`

Este módulo implementa una ALU modular capaz de realizar las siguientes operaciones:

- Suma
- Resta
- AND
- OR
- Desplazamiento lógico a la izquierda (Shift Left)
- Desplazamiento aritmético a la derecha (Shift Right Arithmetic)

####  Archivos:
- `alu_top_8bit.sv` → Módulo principal de la ALU.
- `prefix_adder_8bit.sv` → Sumador tipo Prefix como núcleo aritmético.
- `addsub_8bit.sv` → Controlador de operación suma/resta.
- `and_8bit.sv`, `or_8bit.sv` → Módulos lógicos.
- `shift_left_8bit.sv`, `shift_right_arithmetic_8bit.sv` → Shifters personalizados.
- `alu_tb.sv` → Testbench funcional de la ALU.
- `alu_constraints.xdc` → Archivo de restricciones (pines) para la Basys 3.

####  Videos:
-  [Explicación del código en Vivado (YouTube)](https://youtu.be/U-FhF5hJ83A)
-  [Funcionamiento en Basys 3 (YouTube)](https://youtu.be/eoR8JBBMn5E)

---

##  2. FSM de Llenado y Sellado de Botellas

###  Carpeta: `fsm_llenado_sellado/`

Este diseño implementa un sistema automático usando dos FSMs:

- FSM tipo **Moore** que controla el llenado del envase.
- FSM tipo **Mealy** que se encarga del sellado del envase.

Ambas FSMs son controladas por un reloj de 1 Hz generado por un **prescaler**, lo cual permite visualizar los cambios de estado en la placa.

####  Archivos:
- `fsm_top.sv` → Módulo principal que interconecta ambas FSMs.
- `fsm_moore_filler.sv` → FSM de llenado tipo Moore.
- `fsm_mealy_sealer.sv` → FSM de sellado tipo Mealy.
- `prescaler_clk.sv` → Prescaler de 100 MHz a 1 Hz.
- `top.sv` → Módulo superior que integra FSM y prescaler.
- `fsm_constraints.xdc` → Archivo de restricciones (pines) para Basys 3.

####  Videos:
-  [Explicación del código en Vivado (YouTube)](https://youtu.be/ic9aC_-2JNU)
-  [Funcionamiento en Basys 3 (YouTube)](https://youtube.com/shorts/Kb24iHGJmjc)

---

##  Recursos de FPGA utilizados

El diseño hace uso de los principales recursos del FPGA como:

- **LUTs (Look-Up Tables):** Implementan la lógica combinacional de cada operación y transición de estado.
- **Flip-Flops:** Almacenan los estados de las FSMs y el contador del prescaler.
- **CLBs (Configurable Logic Blocks):** Agrupaciones internas que contienen LUTs y flip-flops.
- **Slices:** Agrupaciones físicas en la FPGA que contienen varios CLBs.
- **Constraints (.xdc):** Archivos de configuración donde se define el mapeo de señales a los pines físicos de la Basys 3.

---

##  Requisitos

- Vivado 2023.1 o superior
- Placa Digilent Basys 3
- Conocimientos en SystemVerilog y diseño digital

---

##  Autor

Proyecto desarrollado por: **Alejandro Paz**  
Carrera: **Ingeniería en Electrónica**  
Año: 2025

---

##  Licencia

Este proyecto se comparte con fines académicos bajo la licencia MIT.
