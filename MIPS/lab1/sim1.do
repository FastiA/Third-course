vlib work

vlog shiftLeftBy2.v shiftLeftBy2_tb.v

vsim work.shiftLeftBy2_tb

add wave /shiftLeftBy2_tb/i_data 
add wave /shiftLeftBy2_tb/o_data

run -all
wave zoom full