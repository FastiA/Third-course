vlib work

vlog MFFSM.v FFSM.v FSM.v rom.v decoder.v register.v MFFSM_tb.v

vsim work.MFFSM_tb

add wave /MFFSM_tb/Resetn
add wave /MFFSM_tb/Mclk
add wave /MFFSM_tb/Pclk
add wave /MFFSM_tb/Run
add wave /MFFSM_tb/mffsm/Run_R
add wave /MFFSM_tb/Done
add wave /MFFSM_tb/mffsm/memory/o_data
add wave /MFFSM_tb/Bus

add wave /MFFSM_tb/mffsm/ffsm/control_unit/c_state
add wave /MFFSM_tb/mffsm/ffsm/control_unit/n_state
add wave /MFFSM_tb/mffsm/ffsm/control_unit/IR
add wave /MFFSM_tb/mffsm/ffsm/control_unit/IRin


add wave /MFFSM_tb/mffsm/ffsm/R0/o_data
add wave /MFFSM_tb/mffsm/ffsm/R1/o_data
add wave /MFFSM_tb/mffsm/ffsm/R2/o_data
add wave /MFFSM_tb/mffsm/ffsm/R3/o_data
add wave /MFFSM_tb/mffsm/ffsm/R4/o_data
add wave /MFFSM_tb/mffsm/ffsm/R5/o_data
add wave /MFFSM_tb/mffsm/ffsm/R6/o_data
add wave /MFFSM_tb/mffsm/ffsm/R7/o_data
add wave /MFFSM_tb/mffsm/ffsm/A/o_data
add wave /MFFSM_tb/mffsm/ffsm/G/o_data


onbreak resume


run -all

wave zoom full