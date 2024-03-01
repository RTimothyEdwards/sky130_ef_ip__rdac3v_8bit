# Run script for netgen LVS
#
# NOTE:  Assumes PDK_ROOT is set in the environment: $::env(PDK_ROOT).
# and PDK is set in the environment: $::env(PDK)
#
# Script reads IP for the HVL library from the PDK, then compares netlists.
# Assumes that netgen is called with cwd = the directory above this one.

set pdklib $::env(PDK_ROOT)/$::env(PDK)
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref

set setupfile ${techlibs}/netgen/sky130A_setup.tcl
set hvlib ${reflibs}/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice

set circuit1 [readnet spice netlist/lvs/dac_3v_8bit.spice]
set circuit2 [readnet spice $hvlib]
readnet spice netlist/schem/dac_3v_8bit.spice $circuit2

lvs "$circuit1 dac_3v_8bit" "$circuit2 dac_3v_8bit" $setupfile \
	reports/dac_3v_8bit_comp.out -json
