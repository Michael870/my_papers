#
# Common parameters for plots comparing shadow vs something
#
set terminal postscript eps enhanced color colortext \
	dashed dashlength 4.0 linewidth 0.7 butt \
	"Helvetica" 45
# set size 2.5,1.5
set size 2.5,2.0
set tmargin 1
set rmargin 8	# Make room for the xtick label
set grid front
#set grid y

# The 3 at the end says draw the border on the left and bottom only
set border lc rgbcolor "grey10" 3

# Don't put ticks on the border we just erased
#set ytics nomirror
#set xtics nomirror rotate by -45 scale 0

set tics out textcolor rgbcolor "#000000"


set grid lc rgbcolor "#606060"
set title tc rgbcolor "#000000"
set ylabel tc rgbcolor "#000000"
set y2label tc rgbcolor "#000000"
set y2tics textcolor rgbcolor "#000000"
set xlabel tc rgbcolor "#000000"

# pt 7 is a filled circle
# pt 9 is a filled triangle
# pt 13 is a filled diamond
# pt 11 is a filled upside-down triangle
# pt 15 is a filled pentagon
set style line 1 lc rgbcolor "#64751e" ps 4 pt 15 lw 20 lt 1
#set style line 1 lc rgbcolor "#aa0000" ps 4 pt 15 lw 20 lt 1
set style line 2 lc rgbcolor "#a5c232" ps 4 pt 7 lw 20 lt 2
set style line 3 lc rgbcolor "#754d1e" ps 4 pt 9 lw 20 lt 3
set style line 4 lc rgbcolor "#c27f32" ps 4 pt 11 lw 20 lt 1

set style line 5 lc rgbcolor "#003399" ps 4 pt 12 lw 20 lt 1
set style line 6 lc rgbcolor "#003399" ps 4 pt 7 lw 20 lt 2

#set style line 5 lc rgbcolor "#8a8a8a" ps 4 pt 12 lw 20 lt 1
#set style line 6 lc rgbcolor "#8a8a8a" ps 4 pt 7 lw 20 lt 2
set style line 9 lc rgbcolor "#cccccc" ps 4 pt 15 lw 45 lt 1

set datafile missing "-"

set ytics (        "0.0"       0, \
                   "0.2"      0.2, \
                   "0.4"      0.4, \
                   "0.6"      0.6, \
                  "0.8"      0.8, \
		  "1.0"      1.0 \
          )		 
