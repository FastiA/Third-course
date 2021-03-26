vlib work

vlog alu.v testb.v

vsim work.testb

add wave /testb/i_a
add wave /testb/i_b
add wave /testb/i_addr
add wave /testb/o_result 

run -all
wave zoom full