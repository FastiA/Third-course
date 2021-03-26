vlib work

vlog adder.v rom.v ram.v aluControl.v alu.v tb_lab.v

vsim work.tb_lab

add wave /tb_lab/i_clk
add wave /tb_lab/i_op1
add wave /tb_lab/i_op2
add wave /tb_lab/o_result 
add wave /tb_lab/i_addr_rom
add wave /tb_lab/o_data_rom
add wave /tb_lab/i_addr_ram
add wave /tb_lab/i_we_ram
add wave /tb_lab/o_aluControl
add wave /tb_lab/o_result_alu
add wave /tb_lab/ram/mem

run -all
wave zoom full