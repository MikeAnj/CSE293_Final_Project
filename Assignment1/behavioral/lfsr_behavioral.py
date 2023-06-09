import pyrtl

init = pyrtl.Input(1,'init')

data_in = pyrtl.Input(8,'data_in')
data_out = pyrtl.Output(8,'data_out')
data_reg = pyrtl.Register(8,'data_reg')

with pyrtl.conditional_assignment:
	with ~init:
		data_reg.next |= pyrtl.concat(		data_reg[6],						#bit7
											data_reg[5],						#bit6
											data_reg[4],						#bit5
											data_reg[3]^data_reg[7],			#bit4
											data_reg[2]^data_reg[7],			#bit3
											data_reg[1]^data_reg[7],			#bit2
											data_reg[0],						#bit1
											data_reg[7],						#bit0
									)
	with pyrtl.otherwise:
		data_reg.next |= data_in

data_out<<=data_reg

sim = pyrtl.Simulation()
sim.step_multiple({
	'data_in' 	: [0,165,0,0,0,0,0,0,0,0,0,0,165,0,0,0,0,0,0,0,0,0,0,0],
	'init'		: [0,1,0,0,0 ,0,0,0,0,0 ,0,0,1,0,0,0,0,0,0,0,0,0,0,0]
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
with open("lfsr_behavioral.gv" , "w") as file:
	pyrtl.output_to_graphviz(file=file)

# GENERATING THE VERILOG CODE AND THE TEST BENCH
with open("lfsr_behavioral.v","w") as file:
	pyrtl.output_to_verilog(file)

with open("lfsr_behavioral_tb.v","w") as file:
	pyrtl.output_verilog_testbench(file, simulation_trace = sim.tracer, toplevel_include="lfsr_behavioral.v",
	vcd="lfsr_behavioral.vcd")
