cd '/var/www/dec/data'
set datafile separator ","
set title 'MDI DF'
set grid
set term png
set timefmt "%y-%m-%d_%H:%M:%S"
set format x "%H%M"
set xdata time
set output 'mv5000-DF.png'
plot 'output.csv' using 1:7
