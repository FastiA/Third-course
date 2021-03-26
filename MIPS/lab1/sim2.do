vlib work

vlog pc.v pc_tb.v

vsim work.pc_tb

add wave /pc_tb/i_clk
add wave /pc_tb/i_rst_n 
add wave /pc_tb/i_pc
add wave /pc_tb/o_pc

run -all
wave zoom full