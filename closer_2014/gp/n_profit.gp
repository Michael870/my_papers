load "profit_header.gp"

set ylabel "Expected Profits"
set xlabel "Number of Tasks"

set yrange[ 0 : 2.2 ]
set xrange[ 100 : 10000000 ]

set xzeroaxis linetype -1 linewidth 9.0
set key top right

#set format y "%.0s"
unset logscale y
unset logscale x

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

set output "../diagrams/n_profit.eps"

plot "../data/n_profit.dat" using 1:2 title "Shadow" smooth unique linestyle 1, \
     "" using 1:3 title "Traditional" smooth unique ls 2, \
     "" using 1:4 title "Stretched" smooth unique ls 3, \
     "" using 1:5 title "Re-execution" smooth unique ls 4
