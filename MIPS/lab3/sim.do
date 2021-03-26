vlib work

vlog main.v tb_lab.v

vsim work.tb_lab

add wave /tb_lab/main/i_clk
add wave /tb_lab/main/o_addr_instr
add wave /tb_lab/main/o_data_instr
add wave /tb_lab/main/o_addr_mux_RtRd
add wave /tb_lab/main/o_rdata_Rs
add wave /tb_lab/main/o_rdata_Rt
add wave /tb_lab/main/o_data_extender
add wave /tb_lab/main/o_data_mux_RtImm
add wave /tb_lab/main/o_data_aluControl
add wave /tb_lab/main/o_data_result_alu
add wave /tb_lab/main/o_zf
add wave /tb_lab/main/o_data_mem
add wave /tb_lab/main/o_data_mux_AluresDMEM
add wave /tb_lab/main/o_addr_pcadder
add wave /tb_lab/main/o_addr_nextpc
add wave /tb_lab/main/o_addr_mux_PCorNextpc
add wave /tb_lab/main/regFile/reg_file
add wave /tb_lab/main/datamem/mem
add wave /tb_lab/main/instrmem/rom

run -all
wave zoom full