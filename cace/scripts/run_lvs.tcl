# Generic Tcl script to run LVS through CACE
# to use this script with any block, just add any extra needed libraries 


if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /usr/local/share/pdk}
if {[catch {set PDK $::env(PDK)}]} {set PDK sky130A}

set pdklib ${PDK_ROOT}/${PDK}
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref
#CACE_ROOT is an env vairable that's set during the proccess of running CACE
set CACE_ROOT $::env(CACE_ROOT)

set setupfile ${techlibs}/netgen/${PDK}_setup.tcl
set hvlib ${reflibs}/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice
set hdlib ${reflibs}/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice

#ipname is set to the ip directory name 
set ipname [file tail $CACE_ROOT]  

set circuit1 [readnet spice $CACE_ROOT/netlist/layout/${ipname}.spice]
set circuit2 [readnet spice $hvlib]


#readnet spice $hdlib $circuit2
readnet spice $CACE_ROOT/netlist/schematic/${ipname}.spice $circuit2

#debug on

lvs "$circuit1 ${ipname}" "$circuit2 ${ipname}" $setupfile ${ipname}_comp.out -json
