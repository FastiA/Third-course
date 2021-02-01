vlib work

vlog first.v testb1.v

vsim work.testb1

add wave /testb1/i_clk
add wave /testb1/i_rst
add wave /testb1/X
add wave /testb1/Y
add wave /testb1/Z1
add wave /testb1/Z2

run -all
wave zoom full