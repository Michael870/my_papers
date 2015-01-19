
load "speed_header.gp"

set ylabel "Normalized Execution Speed"
set xlabel "Static Power Ratio"

#set key top right reverse

c5= "#7C7FB3"

set yrange[ 0 : 1.1 ]
set xrange[ 0.1 : 1 ]
# removing 'transparent' to print correctly;
# image gets distored when printing in black&white
#set style rectangle fc rgb c5
#set style rectangle fs solid 0.3 noborder
#set style rectangle fs transparent solid 0.3 noborder
#set object 1 rect from 4,25000 to 50,223872

set xzeroaxis linetype -1 linewidth 9.0
set key center right

#set format y "%.0s"
unset logscale y
unset logscale x

set xtics (   "0" 0,\
	      "0.1" 0.1, \
	      "0.2" 0.2, \
	      "0.3" 0.3, \
	      "0.4" 0.4, \
	      "0.5" 0.5, \
	      "0.6" 0.6, \
	      "0.7" 0.7, \
	      "0.8" 0.8, \
	      "0.9" 0.9, \
	      "1" 1 \
)
#set logscale x 10
unset y2tics

set output "../diagrams/rho_speed.eps"

plot "../data/rho_speed.dat" using 1:4 title "{/Symbol s}_a" smooth unique ls 1, \
     "" using 1:2 title "{/Symbol s}_m" smooth unique ls 2, \
     "" using 1:3 title "{/Symbol s}_b" smooth unique ls 3

