transcript on
vlib work

vlog counter.v testb2.v

vsim -t 1ns -voptargs="+acc" testb2

add wave /testb2/i_clk
add wave /testb2/i_rst_n
add wave /testb2/i_load 
add wave /testb2/i_data
add wave /testb2/o_counter
configure wave -timelineunits ns

run -all
wave zoom full