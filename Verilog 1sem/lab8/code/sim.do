vlib work

vlog MFFSM.v FFSM.v FSM.v rom.v decoder.v register.v MFFSM_tb.v

vsim -t 1ns -voptargs="+acc" work.MCU_test

add wave /MFFSM_tb/Resetn
add wave /MFFSM_tb/Mclk
add wave /MFFSM_tb/counter
add wave /MFFSM_tb/mffsm/o_counter
add wave /MFFSM_tb/mffsm/memory/data
add wave /MFFSM_tb/Pclk
add wave /MFFSM_tb/Run
add wave /MFFSM_tb/mffsm/i_Run
add wave /MFFSM_tb/mffsm/Run_R
add wave /MFFSM_tb/Done
add wave /MFFSM_tb/Bus

add wave /MCU_test/mcu/scu/control_unit/current_state
add wave /MCU_test/mcu/scu/control_unit/next_state
add wave /MCU_test/mcu/scu/IR
add wave /MCU_test/mcu/scu/control_unit/IR
add wave /MCU_test/mcu/scu/control_unit/IRin
add wave /MCU_test/mcu/scu//IRin
add wave /MCU_test/mcu/scu/control_unit/command
add wave /MCU_test/mcu/scu/control_unit/reg_control
add wave /MCU_test/mcu/scu/control_unit/mul_control
add wave /MCU_test/mcu/scu/control_unit/DINout
add wave /MCU_test/mcu/scu/mux_control


add wave /MCU_test/mcu/scu/R0/data
add wave /MCU_test/mcu/scu/R1/data
add wave /MCU_test/mcu/scu/R2/data
add wave /MCU_test/mcu/scu/R3/data
add wave /MCU_test/mcu/scu/R4/data
add wave /MCU_test/mcu/scu/R5/data
add wave /MCU_test/mcu/scu/R6/data
add wave /MCU_test/mcu/scu/R7/data
add wave /MCU_test/mcu/scu/A/data
add wave /MCU_test/mcu/scu/alu_w
add wave /MCU_test/mcu/scu/G/data
add wave /MCU_test/mcu/scu/G/we
add wave /MCU_test/mcu/scu/bus_to_alu
add wave /MCU_test/mcu/scu/alu

add wave /MCU_test/mcu/scu/Din
add wave /MCU_test/mcu/scu/R0in
add wave /MCU_test/mcu/scu/R1in
add wave /MCU_test/mcu/scu/R2in
add wave /MCU_test/mcu/scu/R3in
add wave /MCU_test/mcu/scu/R4in
add wave /MCU_test/mcu/scu/R5in
add wave /MCU_test/mcu/scu/R6in
add wave /MCU_test/mcu/scu/R7in
add wave /MCU_test/mcu/scu/Ain
add wave /MCU_test/mcu/scu/Gin

add wave /MCU_test/mcu/scu/R0out
add wave /MCU_test/mcu/scu/R1out
add wave /MCU_test/mcu/scu/R2out
add wave /MCU_test/mcu/scu/R3out
add wave /MCU_test/mcu/scu/R4out
add wave /MCU_test/mcu/scu/R5out
add wave /MCU_test/mcu/scu/R6out
add wave /MCU_test/mcu/scu/R7out
add wave /MCU_test/mcu/scu/Gout
add wave /MCU_test/mcu/scu/DINout


onbreak resume
run -all

wave zoom full