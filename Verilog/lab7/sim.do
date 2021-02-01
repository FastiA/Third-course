vlib work

vlog cm.v main.v um.v testb.v

vsim work.testb

add wave /testb/i_clk
add wave /testb/main_mode
add wave /testb/mode
add wave /testb/i_a1
add wave /testb/i_a2
add wave /testb/i_b1
add wave /testb/i_b2
add wave /testb/o_r1
add wave /testb/o_r2

run -all
wave zoom full