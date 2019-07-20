#cd F:/lab/fpga/define_function
#do ts.do

vlib work
#vmap work work
vlog -reportprogress 300 -work work F:/lab/fpga/define_function/define_function_tst.v 
vlog -reportprogress 300 -work work F:/lab/fpga/define_function/define_function.v

vsim work.define_function_tst

#add wave/define_function_tst/*
do wave.do
run 10us

