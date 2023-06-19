import pyrtl

def lfsr_module(init,data_in,initial_data):
	
	return pyrtl.mux(init,data_in,initial_data)	# output data_in if init==0 otherwise output initial_data

init = pyrtl.Input(1,'init')
initial_data = pyrtl.Input(8,'initial_data')

bit0_out = pyrtl.Register(1,'bit0_out')
bit1_out = pyrtl.Register(1,'bit1_out')
bit2_out = pyrtl.Register(1,'bit2_out')
bit3_out = pyrtl.Register(1,'bit3_out')
bit4_out = pyrtl.Register(1,'bit4_out')
bit5_out = pyrtl.Register(1,'bit5_out')
bit6_out = pyrtl.Register(1,'bit6_out')
bit7_out = pyrtl.Register(1,'bit7_out')

Output = pyrtl.Output(8,'Output')
Output <<= pyrtl.concat(bit7_out,bit6_out,bit5_out,bit4_out,bit3_out,bit2_out,bit1_out,bit0_out)

#----- bit0
bit0_out.next <<= lfsr_module(init,bit7_out, initial_data[0])
#----- bit1                             
bit1_out.next <<= lfsr_module(init,bit0_out, initial_data[1])
#----- bit2                 			
bit2_out.next <<= lfsr_module(init,bit1_out ^ bit7_out ,initial_data[2])
#----- bit3                             
bit3_out.next <<= lfsr_module(init,bit2_out ^ bit7_out ,initial_data[3])
#----- bit4                             
bit4_out.next <<= lfsr_module(init,bit3_out ^ bit7_out ,initial_data[4])
#----- bit5                             
bit5_out.next <<= lfsr_module(init,bit4_out, initial_data[5])
#----- bit6                             
bit6_out.next <<= lfsr_module(init,bit5_out, initial_data[6])
#----- bit7                             
bit7_out.next <<= lfsr_module(init,bit6_out, initial_data[7])

sim = pyrtl.Simulation()
sim.step_multiple({
#		Time Units 			 1  ,2,  3  ,4,5,6,7,8,9,10,11,12,13
	'init' : 				[0  ,1  ,0  ,0,0,0,0,0,0,0,0,0,1  ,0,0,0,0,0,0,0,0,0,0,0],
	'initial_data' :			[0  ,165,165,0,0,0,0,0,0,0,0,0,165,0,0,0,0,0,0,0,0,0,0,0]
})

sim.tracer.render_trace()
# -------------------------------------------------------------------------------
# Now we will do the timing analysis as well as print out the critical path

# Generating timing analysis information
print("Pre Synthesis:\n")
timing = pyrtl.TimingAnalysis()
timing.print_max_length()

# Printing out the critical paths as well as get them
# back as an array.
critical_path_info = timing.critical_path()

# --- Part 2: Area Analysis --------------------------------------------------

# Estimates for the area that would be used up if the
# circuit was printed as an ASIC.

logic_area, mem_area = pyrtl.area_estimation(tech_in_nm=65)
est_area = logic_area + mem_area
print("Estimated Area of block", est_area, "sq mm")
print()


# --- Part 3: Synthesis ------------------------------------------------------

# Synthesis is the operation of reducing the circuit into simpler components.
# The base synthesis function breaks down the more complex logic operations
# into logic gates (keeping registers and memories intact) as well as reduces
# all combinatorial logic into operations that only use 1-bitwidth wires.
#
# This synthesis allows for PyRTL to make optimizations to the net structure
# as well as prepares it for further transformations on the PyRTL toolchain.

pyrtl.synthesize()

print("Pre Optimization:\n")
timing = pyrtl.TimingAnalysis()
timing.print_max_length()
for net in pyrtl.working_block().logic:
    print(str(net))
print()


# --- Part 4: Optimization ----------------------------------------------------

# PyRTL has functions built-in to eliminate unnecessary logic from the
# circuit. These functions are all done with a simple call:
pyrtl.optimize()

# Now to see the difference
print("Post Optimization:\n")
timing = pyrtl.TimingAnalysis()
timing.print_max_length()

for net in pyrtl.working_block().logic:
    print(str(net))

# As we can see, the number of nets in the circuit was drastically reduced by
# the optimization algorithm.

# -------------------------------------------------------------------------------
# VISAULIZING THE CIRCUIT
# TO VIEW THE GENERATED .gv FILE IN LINUX ISSUE THE FOLLOWING IN TERMINAL:
# dot -Tpng FILENAME.gv > FILENAME.png
# open FILENAME.png
# TO OPEN THE .gv FILE SIMPLY ISSUE THE FOLLOWING:
# open FILENAME.gv
with open("lfsr_structural.gv" , "w") as file:
	pyrtl.output_to_graphviz(file=file)

# GENERATING THE VERILOG CODE AND THE TEST BENCH
with open("lfsr_structural.v","w") as file:
	pyrtl.output_to_verilog(file)

with open("lfsr_structural_tb.v","w") as file:
	pyrtl.output_verilog_testbench(file, simulation_trace = sim.tracer, toplevel_include="lfsr_structural.v",
	vcd="lfsr_structural.vcd")
