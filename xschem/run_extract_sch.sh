#! /bin/bash

xschem -n -s -r -x -q --tcl "set lvs_netlist 1" --rcfile $PDK_ROOT/$PDK/libs.tech/xschem/xschemrc -o ../netlist/schematic -N sky130_ef_ip__rdac3v_8bit.spice sky130_ef_ip__rdac3v_8bit.sch

