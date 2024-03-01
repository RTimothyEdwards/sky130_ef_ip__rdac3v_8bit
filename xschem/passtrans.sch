v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 370 -1660 430 -1660 {
lab=enab}
N 370 -1550 430 -1550 {
lab=ena}
N 470 -1630 470 -1580 {
lab=in}
N 470 -1690 600 -1690 {
lab=out}
N 600 -1690 600 -1520 {
lab=out}
N 470 -1520 600 -1520 {
lab=out}
N 470 -1550 540 -1550 {
lab=vss}
N 540 -1550 540 -1490 {
lab=vss}
N 470 -1490 540 -1490 {
lab=vss}
N 470 -1660 540 -1660 {
lab=vdd}
N 540 -1720 540 -1660 {
lab=vdd}
N 370 -1720 540 -1720 {
lab=vdd}
N 370 -1490 470 -1490 {
lab=vss}
N 370 -1610 470 -1610 {
lab=in}
N 600 -1610 660 -1610 {
lab=out}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 450 -1550 0 0 {name=M1
L=0.5
W=0.65
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 450 -1660 0 0 {name=M2
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/ipin.sym} 370 -1660 0 0 {name=p1 lab=enab}
C {devices/ipin.sym} 370 -1550 0 0 {name=p2 lab=ena}
C {devices/ipin.sym} 370 -1490 0 0 {name=p3 lab=vss}
C {devices/ipin.sym} 370 -1720 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 370 -1610 0 0 {name=p5 lab=in}
C {devices/opin.sym} 660 -1610 0 0 {name=p6 lab=out}
