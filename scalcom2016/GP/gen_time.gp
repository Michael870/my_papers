#
# Common parameters for plots comparing shadow vs something
#
set terminal postscript eps enhanced color colortext \
	dashed dashlength 0.5 linewidth 1.7 butt \
	"Helvetica" 45
set termoption dash
set size 2.5,2.0
set tmargin 1
set rmargin 8	# Make room for the xtick label
set grid back lt 2 

# The 3 at the end says draw the border on the left and bottom only
set border lc rgbcolor "grey10" 3

# Don't put ticks on the border we just erased
#set ytics nomirror
#set xtics nomirror rotate by -45 scale 0

set tics out textcolor rgbcolor "#000000"


set grid lc rgbcolor "#c8c8c8"
set title tc rgbcolor "#000000"
set ylabel tc rgbcolor "#000000"
set y2label tc rgbcolor "#000000"
set y2tics textcolor rgbcolor "#000000"
set xlabel tc rgbcolor "#000000"

# pt 7 is a filled circle
# pt 9 is a filled triangle
# pt 13 is a filled diamond
# pt 11 is a filled upside-down triangle
set for [i=1:8] linetype i dashtype i
# pt 15 is a filled pentagon
set style line 1 lc rgbcolor "#1587EB" ps 4 pt 15 lw 10 lt 1
set style line 2 lc rgbcolor "#a5c232" ps 4 pt 7 lw 20 lt 2
set style line 3 lc rgbcolor "orange" ps 4 pt 9 lw 20 lt 4
#set style line 3 lc rgbcolor "#754d1e" ps 4 pt 9 lw 20 lt 3
set style line 4 lc rgbcolor "#c27f32" ps 4 pt 11 lw 20 lt 6

set style line 5 lc rgbcolor "#003399" ps 4 pt 12 lw 20 lt 1
set style line 6 lc rgbcolor "#003399" ps 4 pt 7 lw 20 lt 2

#set style line 5 lc rgbcolor "#8a8a8a" ps 4 pt 12 lw 20 lt 1
#set style line 6 lc rgbcolor "#8a8a8a" ps 4 pt 7 lw 20 lt 2
set style line 9 lc rgbcolor "#cccccc" ps 4 pt 15 lw 45 lt 1

set datafile missing "-"

set ytics (        "0.0"       0, \
                   "0.5"      0.5, \
                   "1.0"      1.0, \
                   "1.5"      1.5, \
                   "2.0"      2.0, \
		           "2.5"      2.5, \
		           "3.0"      3.0 \
          )		 



set ylabel "Time"
set xlabel "MTBF (year)"

set key right top

c5= "#7C7FB3"

set yrange[ 1.5: 3 ]
set xrange[ 1 : 25]
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

set xtics (   "1" 1, \
              "3"  3, \
              "5"  5, \
              "7"  7, \
              "9"  9,\
              "11"  11,\
              "13"  13,\
              "15"  15,\
              "17"  17,\
              "19"  19,\
              "21"  21,\
              "23"  23,\
              "25"  25\
)
#set logscale x 10

unset y2tics

set output "../Figures/gen_time.eps"

plot "../Data/general_time.dat" using 1:2 title "Process replication ({/Symbol a}=1)" smooth bezier linestyle 1, \
     "" using 1:3 title "Lazy Shadowing ({/Symbol a}=5)" smooth bezier ls 2, \
     "" using 1:4 title "Lazy Shadowing ({/Symbol a}=10)" smooth bezier ls 3


