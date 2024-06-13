#!/bin/bash
#
# NOTE:  Currently (as of 6/13/2024), do not use this script
# as there is an extraction issue in the DAC.  The DAC layout
# must be flattened prior to extraction.  The script
# run_lvs_flat.sh does this.

echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=sky130A} > /dev/null

netgen -batch source run_lvs.tcl | tee netgen.log

