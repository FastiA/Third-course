vlib work

vlog mux2in1.v mux2in1_tb.v

vsim work.mux2in1_tb

add wave /mux2in1_tb/i_control
add wave /mux2in1_tb/i_dat0
add wave /mux2in1_tb/i_dat1 
add wave /mux2in1_tb/o_dat

run -all
wave zoom full