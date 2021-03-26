vlib work

vlog reg8.v testb1.v

vsim work.testb1

add wave /testb1/i_clk
add wave /testb1/i_prn
add wave /testb1/i_rst_n
add wave /testb1/i_we 
add wave /testb1/i_data
add wave /testb1/o_data 

run -all
wave zoom full