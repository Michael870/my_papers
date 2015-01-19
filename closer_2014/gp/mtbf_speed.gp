load "speed_header.gp"

set ylabel "Normalized Execution Speed"
set xlabel "Failure Vulnerability"

set key top right 

c5= "#7C7FB3"

set yrange[ 0 : 1.1 ]
set xrange[ 2 : 200000000 ]
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

set xtics (   "1E-10" 1, \
    	      "1E-9"  10, \
    	      "1E-8"  100, \
	      "1E-7"  1000, \
	      "1E-6"  10000,\
	      "1E-5"  100000,\
	      "1E-4"  1000000,\
	      "1E-3"  10000000,\
	      "1E-2"  100000000\
)
set logscale x 10
unset y2tics

set output "../diagrams/mtbf_speed.eps"

plot "../data/mtbf_speed.dat" using 1:4 title "{/Symbol s}_a" smooth unique ls 1, \
     "" using 1:2 title "{/Symbol s}_m" smooth unique ls 2, \
     "" using 1:3 title "{/Symbol s}_b" smooth unique ls 3

