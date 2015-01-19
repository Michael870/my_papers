load "header1.gp"

set ylabel "Time"
set xlabel "Number of failures"

set yrange[ 0 : 1.2 ]
set xrange[ 0 : 10 ]

set xzeroaxis linetype -1 linewidth 9.0
set key cent right

#set format y "\0.0s"
unset logscale y
unset logscale x

set xtics (   \
		  "0" 0, \
	      "1" 1, \
	      "2" 2, \
	      "3" 3, \
	      "4" 4, \
	      "5" 5, \
	      "6" 6, \
	      "7" 7, \
	      "8" 8, \
	      "9" 9, \
	      "10" 10 \
)
#set logscale x 10
unset y2tics

set output "../Figures/time_k.eps"

plot "../Data/time_k.dat" using 1:2 title "{/Symbol a}=3" smooth unique linestyle 1, \
     "" using 1:3 title "{/Symbol a}=5" smooth unique ls 2, \
     "" using 1:4 title "{/Symbol a}=7" smooth unique ls 3, \
     "" using 1:5 title "{/Symbol a}=9" smooth unique ls 4
