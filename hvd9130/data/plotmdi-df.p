set datafile separator ","
set title 'MDI DF'
set grid
set term png
set timefmt "%y-%m-%d_%H:%M:%S"
set format x "%H%M"
set xdata time
set output 'plotmdi-df.png'
plot 'output.csv' using 1:8 with line title "Delay Factor", \
'output.csv' using 1:10 with line title "SBS size", \
'output.csv' using 1:12 with line title "Current Delay"
