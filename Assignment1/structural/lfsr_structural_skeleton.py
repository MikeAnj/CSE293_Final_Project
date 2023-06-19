# PLEASE ONLY MODIFY THE PARTS WHICH SAY "YOUR CODE HERE"
# YOU MAY NEED TO LOOK UP THE API FROM PYRTL GITHUB REPOSITORY FOR SOME FUNCTIONS
# ALSO I WOULD RECOMMEND TO COMMENT OUT THE WHOLE FILE AND UNCOMMENT THE PART YOU'RE WORKING ON
# BEFORE MOVING ON TO THE NEXT SECTION, THAT WAY YOU ARE DEVELOPING IN A STEP-WISE MANNER WHICH
# MAKES DEBUGGING MUCH EASIER

import pyrtl

def lfsr_module(init,data_in,initial_data):
	
	return # output data_in if init==0 otherwise output initial_data

init = pyrtl.Input(1,'init')
initial_data = pyrtl.Input(8,'initial_data')

# YOUR CODE HERE
#
# THIS SHOULD BE YOUR MAIN CODE FOR THE STRUCTURAL LFSR
#
#


# LINES 41 - 48 ARE FOR SIMULATION AND THE TERMINAL OUTPUT 165=0xA5
sim = pyrtl.Simulation()
sim.step_multiple({
#		Time Units 			 	 1  ,2,  3  ,4,5,6,7,8,9,10,11,12,13
	'init' : 					[0  ,1  ,0  ,0,0,0,0,0,0,0,0,0,1  ,0,0,0,0,0,0,0,0,0,0,0],
	'initial_data' :			[0  ,165,165,0,0,0,0,0,0,0,0,0,165,0,0,0,0,0,0,0,0,0,0,0]
})

sim.tracer.render_trace()
# -------------------------------------------------------------------------------
# Now we will do the timing analysis as well as print out the critical path

# GENERATE TIMING ANALYSIS INFORMATION AND PRINT THEM ON THE SCREEN
print("Pre Synthesis:\n")
timing = # YOUR CODE HERE

# PRINT OUT THE CRITICAL PATHS AND GET THEM BACK AS AN ARRAY
critical_path_info = # YOUR CODE HERE


# --- Part 2: Area Analysis --------------------------------------------------

# Estimates for the area that would be used up if the
# circuit was printed as an ASIC. Please use 65nm technology for the analysis

logic_area, mem_area = # YOUR CODE HERE
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
# TIMING ANALYSIS AND PRINTING THE MAX LENGTH

# YOUR CODE HERE

# SHOWING THE WORKING BLOCK BEFOR OPTIMIZATION
for net in pyrtl.working_block().logic:
    print(str(net))
print()


# --- Part 4: Optimization ----------------------------------------------------

# PyRTL has functions built-in to eliminate unnecessary logic from the
# circuit. These functions are all done with a simple call:
pyrtl.optimize()

# Now to see the difference
# DO THE SAME AS YOU DID IN STEP 4 OF THIS FILE TO SHOW THE DIFFERENCE

# YOUR CODE HERE

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
	# YOUR CODE HERE

# GENERATING THE VERILOG CODE AND THE TEST BENCH
with open("lfsr_structural.v","w") as file:
	# YOUR CODE HERE

# PLEASE CALL THE .vcd FILE lfsr_structural.vcd	
with open("lfsr_structural_tb.v","w") as file:
	# YOUR CODE HERE
