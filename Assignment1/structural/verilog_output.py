#
#	Assignment 2 : Digital Clock skeleton file
#
import pyrtl

def and_gate(a,b):
	return a&b

def or_gate(a,b):
	return a|b

def main():
	in1=pyrtl.Input(1,'in1')
	in2=pyrtl.Input(1,'in2')
	
	out1=pyrtl.Output(1,'out1')
	
	result1 = and_gate(in1,in2)
	out1 <<= result1
	
#	out2=pyrtl.Output(1,'out2')
#	
#	result2 = or_gate(in1,in2)
#	out2 <<= result2

main()

# change YOUR_VERILOG_FILE.v to your desired file name
with open('YOUR_VERILOG_FILE.v','w') as fp:
	pyrtl.output_to_verilog(fp,add_reset=True)
	pyrtl.output_verilog_testbench(fp,  vcd=None , cmd='$display("%d",out);')
