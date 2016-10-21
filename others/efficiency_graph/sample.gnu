set term postscript eps color

set output 'output.eps'

#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set size 0.6, 0.6
set key right bottom
set yrange [0:1.2]

set xlabel "time_process(clock_cycles)"

plot  'out.txt' using 1:2  with lines notitle, 'out.txt' using 1:3 with lines notitle
        