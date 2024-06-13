v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -90 -2750 -60 -2750 {
lab=#net1}
N 20 -2750 50 -2750 {
lab=#net2}
N 130 -2750 160 -2750 {
lab=#net3}
N 240 -2750 280 -2750 {
lab=bitb_out}
N 260 -2830 260 -2750 {
lab=bitb_out}
N 260 -2830 390 -2830 {
lab=bitb_out}
N 360 -2750 390 -2750 {
lab=bit_out}
N -210 -2750 -170 -2750 {
lab=bit_in}
N -190 -2640 -190 -2580 {
lab=dvss}
N -230 -2580 -190 -2580 {
lab=dvss}
N -210 -2840 -140 -2840 {
lab=dvdd}
N -210 -2880 -140 -2880 {
lab=vdd}
N -190 -2750 -190 -2700 {
lab=bit_in}
C {lsbuflv2hv_1.sym} -130 -2750 0 0 {name=x1 LVPWR=dvdd VGND=dvss VNB=dvss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_2.sym} -20 -2750 0 0 {name=x2 VGND=dvss VNB=dvss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_4.sym} 90 -2750 0 0 {name=x3 VGND=dvss VNB=dvss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_8.sym} 200 -2750 0 0 {name=x4 VGND=dvss VNB=dvss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_8.sym} 320 -2750 0 0 {name=x5 VGND=dvss VNB=dvss VPB=vdd VPWR=vdd prefix=sky130_fd_sc_hvl__ }
C {devices/ipin.sym} -210 -2750 0 0 {name=p1 lab=bit_in}
C {devices/opin.sym} 390 -2750 0 0 {name=p2 lab=bit_out}
C {devices/opin.sym} 390 -2830 0 0 {name=p3 lab=bitb_out}
C {sky130_fd_pr/diode.sym} -190 -2670 0 0 {name=XD1
model=diode_pw2nd_05v5
area=2.025e11
perim=1.8e6
}
C {devices/ipin.sym} -230 -2580 0 0 {name=p4 lab=dvss}
C {devices/ipin.sym} -210 -2840 0 0 {name=p5 lab=dvdd}
C {devices/ipin.sym} -210 -2880 0 0 {name=p6 lab=vdd}
C {devices/lab_pin.sym} -140 -2880 0 1 {name=l1 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -140 -2840 0 1 {name=l2 sig_type=std_logic lab=dvdd}
