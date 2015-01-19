load "header.gp"

set ylabel "Energy"
set xlabel "Applicaton failure probability"

set yrange[ 0.75 : 1 ]
set xrange[ 1 : 10 ]

set xzeroaxis linetype -1 linewidth 9.0
set key top right

#set format y "\0.0s"
unset logscale y
unset logscale x

set xtics (   \
	      "0.01" 1, \
	      "0.02" 2, \
	      "0.03" 3, \
	      "0.04" 4, \
	      "0.05" 5, \
	      "0.06" 6, \
	      "0.07" 7, \
	      "0.08" 8, \
	      "0.09" 9, \
	      "0.10" 10 \
)
#set logscale x 10
unset y2tics

set output "../figures/energy_local.eps"

plot "../data/energy_local.dat" using 1:2 title "{/Symbol a}=3" smooth unique linestyle 1, \
     "" using 1:3 title "{/Symbol a}=5" smooth unique ls 2, \
     "" using 1:4 title "{/Symbol a}=7" smooth unique ls 3, \
     "" using 1:5 title "{/Symbol a}=9" smooth unique ls 4
