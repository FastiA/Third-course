vlib work

vlog counter.v testb1.v 

vsim work.testb1

add wave /testb1/i_clk
add wave /testb1/i_aclear
add wave /testb1/i_load
add wave /testb1/o_counter

run -all
wave zoom full