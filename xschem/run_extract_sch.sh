#! /bin/bash

project=sky130_ef_ip__rdac3v_8bit

echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=sky130A} > /dev/null

# xschem -n -s -r -x -q --tcl "set lvs_netlist 1" --rcfile $PDK_ROOT/$PDK/libs.tech/xschem/xschemrc -o ../netlist/schematic -N $project.spice $project.sch
xschem -n -s -r -x -q --tcl "set lvs_netlist 1" --rcfile xschemrc -o ../netlist/schematic -N $project.spice $project.sch

