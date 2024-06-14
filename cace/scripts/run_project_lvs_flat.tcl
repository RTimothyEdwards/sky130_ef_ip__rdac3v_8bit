# Run script for netgen LVS (with flattened layout)
#
# NOTE:  Assumes PDK_ROOT is set in the environment: $::env(PDK_ROOT).
# and PDK is set in the environment: $::env(PDK)
#
# Script reads IP for the HVL library from the PDK, then compares netlists.
# Assumes that netgen is called with cwd = the directory above this one.

if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /usr/local/share/pdk}
if {[catch {set PDK $::env(PDK)}]} {set PDK sky130A}

if {[file exists netlist]} {set topdir .} else {set topdir ..}

set pdklib ${PDK_ROOT}/${PDK}
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref

set setupfile ${techlibs}/netgen/sky130A_setup.tcl
set hvlib ${reflibs}/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice

set circuit1 [readnet spice ${topdir}/netlist/layout/sky130_ef_ip__rdac3v_8bit_flat.spice]
set circuit2 [readnet spice $hvlib]
readnet spice ${topdir}/netlist/schematic/sky130_ef_ip__rdac3v_8bit.spice $circuit2

lvs "$circuit1 sky130_ef_ip__rdac3v_8bit_flat" "$circuit2 sky130_ef_ip__rdac3v_8bit" \
	$setupfile ${topdir}/reports/sky130_ef_ip__rdac3v_8bit_comp.out
