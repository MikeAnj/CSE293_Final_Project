import pyrtl

# SECONDS
seconds_counter= pyrtl.Register(7,'seconds')
seconds_output = pyrtl.Output(7,'seconds_output')

seconds_output <<= seconds_counter
# MINUTES
minutes_counter= pyrtl.Register(7,'minutes')
minutes_output = pyrtl.Output(7,'minutes_output')

minutes_output <<= minutes_counter

# HOURS
hours_counter= pyrtl.Register(4,'hours', reset_value=1)
hours_output = pyrtl.Output(4,'hours_output')

hours_output <<= hours_counter

with pyrtl.conditional_assignment:
	with seconds_counter!= 59:
		seconds_counter.next |= seconds_counter + 1
	with pyrtl.otherwise:
		seconds_counter.next|= 0	
		with minutes_counter!= 59:
			minutes_counter.next |= minutes_counter + 1
		with pyrtl.otherwise:
			minutes_counter.next|= 0
			with hours_counter!= 12:
				hours_counter.next |= hours_counter + 1
			with pyrtl.otherwise:
				hours_counter.next|= 1

# THIS VARIABLE IS ADDED FOR SIMULATOR
b=pyrtl.Input(1,'b')

c = [0] * 3601			# c LIST IS CREATED FOR SIMULATOR

sim=pyrtl.Simulation()
sim.step_multiple({
	'b':	c
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
with open("digital_clock.gv" , "w") as file:
	pyrtl.output_to_graphviz(file=file)

# GENERATING THE VERILOG CODE AND THE TEST BENCH
with open("digital_clock.v","w") as file:
	pyrtl.output_to_verilog(file)

with open("digital_clock_tb.v","w") as file:
	pyrtl.output_verilog_testbench(file, simulation_trace = sim.tracer, toplevel_include="digital_clock.v",
	vcd="digital_clock.vcd")

