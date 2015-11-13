set datafile separator ","
set title 'MDI Media Loss'
set grid
set term png
set timefmt "%y-%m-%d_%H:%M:%S"
set format x "%H%M"
set xdata time
set xlabel "time"
set output 'plotmdi-ml.png'
plot 'output.csv' using 1:($3/$5*1000000) with line title "Lost ppm" , \
'output.csv' using 1:($8/$11) with boxes title "Lost/sec"
