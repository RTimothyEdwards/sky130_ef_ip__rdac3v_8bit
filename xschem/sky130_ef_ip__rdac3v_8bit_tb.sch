v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 180 -2710 300 -2710 {
lab=out}
N -160 -2840 -120 -2840 {
lab=vdd3v3}
N -160 -2900 -160 -2840 {
lab=vdd3v3}
N -160 -2900 220 -2900 {
lab=vdd3v3}
N 220 -2900 220 -2840 {
lab=vdd3v3}
N 180 -2840 220 -2840 {
lab=vdd3v3}
N 220 -2900 250 -2900 {
lab=vdd3v3}
N 180 -2580 220 -2580 {
lab=GND}
N 220 -2580 220 -2520 {
lab=GND}
N -160 -2520 220 -2520 {
lab=GND}
N -160 -2600 -160 -2520 {
lab=GND}
N -160 -2600 -120 -2600 {
lab=GND}
N -160 -2580 -120 -2580 {
lab=GND}
N -580 -2840 -160 -2840 {
lab=vdd3v3}
N -580 -2840 -580 -2810 {
lab=vdd3v3}
N -580 -2750 -580 -2530 {
lab=GND}
N -600 -2530 -160 -2530 {
lab=GND}
N -520 -2820 -520 -2810 {
lab=#net1}
N -520 -2820 -120 -2820 {
lab=#net1}
N -520 -2750 -520 -2530 {
lab=GND}
N -460 -2800 -120 -2800 {
lab=ena}
N -460 -2800 -460 -2790 {
lab=ena}
N -460 -2730 -460 -2530 {
lab=GND}
N -780 -2530 -600 -2530 {
lab=GND}
N -780 -2550 -780 -2530 {
lab=GND}
N -840 -2530 -780 -2530 {
lab=GND}
N -840 -3100 -840 -2530 {
lab=GND}
N -840 -3100 -780 -3100 {
lab=GND}
N -840 -3020 -780 -3020 {
lab=GND}
N -840 -2940 -780 -2940 {
lab=GND}
N -840 -2860 -780 -2860 {
lab=GND}
N -840 -2780 -780 -2780 {
lab=GND}
N -840 -2700 -780 -2700 {
lab=GND}
N -840 -2620 -780 -2620 {
lab=GND}
N -780 -2600 -220 -2600 {
lab=b7}
N -220 -2640 -220 -2600 {
lab=b7}
N -220 -2640 -120 -2640 {
lab=b7}
N -780 -2680 -300 -2680 {
lab=b6}
N -300 -2680 -300 -2660 {
lab=b6}
N -300 -2660 -120 -2660 {
lab=b6}
N -780 -2760 -630 -2760 {
lab=b5}
N -630 -2760 -630 -2700 {
lab=b5}
N -630 -2700 -290 -2700 {
lab=b5}
N -290 -2700 -290 -2680 {
lab=b5}
N -290 -2680 -120 -2680 {
lab=b5}
N -780 -2840 -620 -2840 {
lab=b4}
N -620 -2840 -620 -2720 {
lab=b4}
N -620 -2720 -280 -2720 {
lab=b4}
N -280 -2720 -280 -2710 {
lab=b4}
N -280 -2710 -280 -2700 {
lab=b4}
N -280 -2700 -120 -2700 {
lab=b4}
N -780 -2920 -270 -2920 {
lab=b3}
N -270 -2920 -270 -2720 {
lab=b3}
N -270 -2720 -120 -2720 {
lab=b3}
N -780 -3000 -260 -3000 {
lab=b2}
N -260 -3000 -260 -2740 {
lab=b2}
N -260 -2740 -120 -2740 {
lab=b2}
N -780 -3080 -250 -3080 {
lab=b1}
N -250 -3080 -250 -2760 {
lab=b1}
N -250 -2760 -120 -2760 {
lab=b1}
N -780 -3160 -240 -3160 {
lab=b0}
N -240 -3160 -240 -2780 {
lab=b0}
N -240 -2780 -120 -2780 {
lab=b0}
N 270 -2710 270 -2690 {
lab=out}
N 270 -2630 270 -2520 {
lab=GND}
N 220 -2520 270 -2520 {
lab=GND}
N 300 -2710 380 -2710 {
lab=out}
N 340 -2710 340 -2690 {
lab=out}
N 340 -2630 340 -2520 {
lab=GND}
N 270 -2520 340 -2520 {
lab=GND}
C {sky130_ef_ip__rdac3v_8bit.sym} 30 -2710 0 0 {name=x1}
C {devices/opin.sym} 380 -2710 0 0 {name=p1 lab=out}
C {devices/opin.sym} 250 -2900 0 0 {name=p2 lab=vdd3v3}
C {devices/gnd.sym} 20 -2520 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -580 -2780 0 0 {name=V1 value=3.3}
C {devices/vsource.sym} -520 -2780 0 0 {name=V2 value=1.8}
C {devices/vsource.sym} -460 -2760 0 0 {name=V3 value="PWL(0 0 10n 0 20n 1.8)"}
C {devices/vsource.sym} -780 -3130 0 0 {name=V11 value="PULSE(0 1.8 50n 5n 5n 1u 2u)"}
C {devices/vsource.sym} -780 -3050 0 0 {name=V4 value="PULSE(0 1.8 50n 5n 5n 2u 4u)"}
C {devices/vsource.sym} -780 -2970 0 0 {name=V6 value="PULSE(0 1.8 50n 5n 5n 4u 8u)"}
C {devices/vsource.sym} -780 -2890 0 0 {name=V7 value="PULSE(0 1.8 50n 5n 5n 8u 16u)"}
C {devices/vsource.sym} -780 -2810 0 0 {name=V8 value="PULSE(0 1.8 50n 5n 5n 16u 32u)"}
C {devices/vsource.sym} -780 -2730 0 0 {name=V9 value="PULSE(0 1.8 50n 5n 5n 32u 64u)"}
C {devices/vsource.sym} -780 -2650 0 0 {name=V10 value="PULSE(0 1.8 50n 5n 5n 64u 128u)"}
C {devices/vsource.sym} -780 -2570 0 0 {name=V12 value="PULSE(0 1.8 50n 5n 5n 128u 256u)"}
C {devices/code.sym} -80 -3110 0 0 {name=Libs only_toplevel=false value="
.lib $PDK_ROOT/$PDK/libs.tech/ngspice/sky130.lib.spice tt
.include $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice
"}
C {devices/code_shown.sym} 100 -3090 0 0 {name=Control only_toplevel=false value="
.control
tran 50m 256u
plot V(out)
.endc"}
C {devices/res.sym} 270 -2660 0 0 {name=R1
value=50k
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 340 -2660 0 0 {name=C1
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -240 -3160 0 1 {name=l2 sig_type=std_logic lab=b0}
C {devices/lab_pin.sym} -290 -3080 0 1 {name=l3 sig_type=std_logic lab=b1}
C {devices/lab_pin.sym} -310 -3000 0 1 {name=l4 sig_type=std_logic lab=b2}
C {devices/lab_pin.sym} -320 -2920 0 1 {name=l5 sig_type=std_logic lab=b3}
C {devices/lab_pin.sym} -340 -2720 0 1 {name=l6 sig_type=std_logic lab=b4}
C {devices/lab_pin.sym} -370 -2700 0 1 {name=l7 sig_type=std_logic lab=b5}
C {devices/lab_pin.sym} -410 -2680 0 1 {name=l8 sig_type=std_logic lab=b6}
C {devices/lab_pin.sym} -410 -2600 0 1 {name=l9 sig_type=std_logic lab=b7}
C {devices/lab_pin.sym} -400 -2800 0 1 {name=l10 sig_type=std_logic lab=ena}
