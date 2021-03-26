vlib work

vlog regFile.v regFile_tb.v

vsim work.regFile_tb

add wave /regFile_tb/i_clk
add wave /regFile_tb/i_raddr1 
add wave /regFile_tb/i_raddr2
add wave /regFile_tb/i_waddr
add wave /regFile_tb/i_wdata
add wave /regFile_tb/i_we
add wave /regFile_tb/o_rdata1
add wave /regFile_tb/o_rdata2

run -all
wave zoom full