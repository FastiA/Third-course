vlib work

vlog signExtend.v signExtend_tb.v

vsim work.signExtend_tb

add wave /signExtend_tb/en
add wave /signExtend_tb/i_data 
add wave /signExtend_tb/o_data

run -all
wave zoom full