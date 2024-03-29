#-----------------------------------------------------------------------
# Octave script for calculating DNL of a DAC
#-----------------------------------------------------------------------
# Octave script for use with efabless CACE
# Written by Tim Edwards, efabless, March 2019
# CACE generates a file with a data structure containing information
# from the SPICE runs in the following format:
#
# Name of file:  results.dat
# Name of structure: results
# Structure elements:
# (1) NAMES:  A list of names of the test conditions
# (2) UNITS:  A list of units of each of the test conditions
# (3) RESULT: The result of the SPICE run (1D or 2D)
# (4) CONDITIONx:  One list of values for each condition x for which the
#	      simulation was made.
#
# The purpose of the script is to manipulate RESULT to produce some
# alternate result, replace the RESULT values, and write output as
# file "results_out.dat".
#
# It is the responsibility of the Octave script to know what the
# incoming RESULT values mean, because the characterization setup will
# give UNITS for the result as the units of the final result (e.g., the
# output of this script).
#-----------------------------------------------------------------------
# DNL calculation:
# x is the digital value b7:0 converted to an integer
# V(x) is the original value in RESULT:  The voltage output of the DAC
#	under the given set of conditions.
# ALSB = (VREFH - VREFL) / 256	(ideal voltage step size per LSB)
#
# DNL(x) = ((RESULT(x) - RESULT(x-1)) / ALSB) - 1	(in units of LSB)
#-----------------------------------------------------------------------
# Assume that results are computed at the same set of conditions
# except for the binary value, and that the binary values are
# enumerated in pairs.  This may comprise a selection of pairs, or
# the entire range or a sub-range of binary values may be given.
# For correct DNL calculations, each pair of binary values should be
# contiguous values.
#-----------------------------------------------------------------------

# Load the results from CACE
args = argv();
load(args{1});

# Find the index of the conditions representing Vhigh, Vlow, and b7:0
# Warning:  Names are space-padded to the length of the longest name so
# that octave has a uniform character matrix.
vhighidx = -1;
vlowidx = -1;
bvecidx = -1;

names = results.("NAMES");
l = length(names);
for i = 1:l,
    n = names(i);
    if (strcmp(n, "Vhigh") == 1),
	vhighidx = i;
    elseif (strcmp(n, "Vlow") == 1),
	vlowidx = i;
    elseif (strcmp(n, "b[7:0]") == 1),
	bvecidx = i;
    endif
endfor

# Sanity checks
if (vhighidx < 0),
    printf("Error:  Cannot find condition Vhigh in list!");
    return
elseif (vlowidx < 0),
    printf("Error:  Cannot find condition Vlow in list!");
    return
elseif (bvecidx < 0),
    printf("Error:  Cannot find condition b[7:0] in list!");
    return
endif

result = results.("RESULT");
rlen = length(result);

# Get the digital value array
cstr = sprintf("CONDITION%d", bvecidx);
bvals = results.(cstr);

# Convert digital binary strings to integer
ivec = bin2dec(bvals);

# Get VREFH value
cstr = sprintf("CONDITION%d", vhighidx);
vhighval = results.(cstr)(1);

# Get VREFL value
cstr = sprintf("CONDITION%d", vlowidx);
vlowval = results.(cstr)(1);

# Compute FSR
fsr = vhighval - vlowval;

# Compute ALSB
alsb = fsr / 256.0;

# For each unique combination of conditions excluding digital value,
# find the ideal and measured slope.  Need to use subsref() function for this.
# For the digital values, find each digital value for which the next contiguous
# digital value exists, so that the two neighboring values needed to compute
# the DNL exist.  Ideally, one runs simulation over all values, but where this
# is prohibitive, pairs of representative digital values can be enumerated.

contiglist = [ivec(2:end) - ivec(1:end-1) == 1; 0];

# Find the step size between all entries
allsteps = (result(2:rlen) - result(1:rlen-1));

# But keep only the step sizes between contiguous entries
stepdiff = allsteps(contiglist(1:rlen-1) ~= 0);

# Compute DNL.  NOTE:  This assumes that all values are in order by
# digital code.  What really should be done here is to find all result
# pairs where all conditions except digital code are the same, and the
# digital codes differ by 1.

dnl = (stepdiff / alsb) - 1;

# Output the result vector, one value per line.  This should be the only text
# generated by the script.
for i = 1: length(dnl),
    printf("%g\n", dnl(i))
endfor

