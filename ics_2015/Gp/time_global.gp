load "header.gp"

set ylabel "Time"
set xlabel "Applicaton failure probability"

set yrange[ 0.95 : 1.15 ]
set xrange[ 10 : 50 ]

set xzeroaxis linetype -1 linewidth 9.0
set key top right

#set format y "\0.0s"
unset logscale y
unset logscale x

set xtics (   \
	      "0.10" 10, \
	      "0.15" 15, \
	      "0.20" 20, \
	      "0.25" 25, \
	      "0.30" 30, \
	      "0.35" 35, \
	      "0.40" 40, \
	      "0.45" 45, \
	      "0.50" 50 \
)
#set logscale x 10
unset y2tics

set output "../Figures/time_global.eps"

plot "../Data/time_global.dat" using 1:2 title "{/Symbol a}=3" smooth unique linestyle 1, \
     "" using 1:3 title "{/Symbol a}=5" smooth unique ls 2, \
     "" using 1:4 title "{/Symbol a}=7" smooth unique ls 3, \
     "" using 1:5 title "{/Symbol a}=9" smooth unique ls 4
