load "profit_header.gp"

set ylabel "Expected Profits"
set xlabel "Failure Vulnerability"

set key right top

c5= "#7C7FB3"

set yrange[ 0 : 2.2 ]
set xrange[ 2 : 20000000 ]
# removing 'transparent' to print correctly;
# image gets distored when printing in black&white
#set style rectangle fc rgb c5
#set style rectangle fs solid 0.3 noborder
#set style rectangle fs transparent solid 0.3 noborder
#set object 1 rect from 4,25000 to 50,223872

set xzeroaxis linetype -1 linewidth 9.0


#set format y "%.0s"
unset logscale y
unset logscale x

set xtics (   "2E-10" 2, \
              "2E-9"  20, \
              "2E-8"  200, \
              "2E-7"  2000, \
              "2E-6"  20000,\
              "2E-5"  200000,\
              "2E-4"  2000000,\
              "2E-3"  20000000,\
              "2E-2"  200000000\
)
set logscale x 10

unset y2tics

set output "../diagrams/mtbf_profit.eps"

plot "../data/mtbf_profit.dat" using 1:2 title "Shadow" smooth unique linestyle 1, \
     "" using 1:3 title "Traditional" smooth unique ls 2, \
     "" using 1:4 title "Stretched" smooth unique ls 3, \
     "" using 1:5 title "Re-execution" smooth unique ls 4


