
load "speed_header.gp"

set ylabel "Normalized Execution Speed"
set xlabel "Number of Tasks"

set yrange[ 0 : 1.1 ]
set xrange[ 1000 : 10000000 ]
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

set y2tics( "0.7" 0.7)

set xtics (   \
	      "1" 1, \
	      "10" 10, \
	      "100" 100, \
	      "1,000" 1000, \
	      "10,000" 10000, \
	      "100,000" 100000, \
	      "1,000,000" 1000000, \
	      "10,000,000" 10000000 \
)
set logscale x 10
unset y2tics

set output "../diagrams/n_speed.eps"

plot "../data/n_speed.dat" using 1:4 title "{/Symbol s}_a" smooth unique linestyle 1, \
     "" using 1:2 title "{/Symbol s}_m" smooth unique ls 2, \
     "" using 1:3 title "{/Symbol s}_b" smooth unique ls 3
