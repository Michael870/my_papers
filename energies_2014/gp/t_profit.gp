load "profit_header.gp"

set ylabel "Expected Profits"
set xlabel "Maximum Reward Response Time"

set yrange[ -1.5 : 2.2 ]
set xrange[ 1 : 1.9 ]

set xzeroaxis linetype -1 linewidth 9.0
set key top right

#set format y "%.0s"
unset logscale y
unset logscale x

set xtics (   \
	      "1.0" 1, \
	      "1.1" 1.1, \
	      "1.2" 1.2, \
	      "1.3" 1.3, \
	      "1.4" 1.4, \
	      "1.5" 1.5, \
	      "1.6" 1.6, \
	      "1.7" 1.7, \
	      "1.8" 1.8, \
	      "1.9" 1.9 \
)
#set logscale x 10
unset y2tics

set output "../diagrams/t_profit.eps"

plot "../data/t_profit.dat" using 1:2 title "Shadow" smooth unique linestyle 1, \
     "" using 1:3 title "Traditional" smooth unique ls 2, \
     "" using 1:4 title "Stretched" smooth unique ls 3, \
     "" using 1:5 title "Re-execution" smooth unique ls 4
