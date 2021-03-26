vlib work

vlog second.v testb2.v

vsim work.testb2

add wave /testb2/i_clk
add wave /testb2/i_rst
add wave /testb2/X1
add wave /testb2/X2
add wave /testb2/o_result

run -all
wave zoom full