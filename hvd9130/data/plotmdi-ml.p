set datafile separator ","
set title 'MDI Media Loss'
set grid
set term png
set xlabel "Kpkt"
set output 'plotmdi-ml.png'
plot 'output.csv' using ($5/1000):($3/$5*1000) title "Lost/Kpkt" , \
'output.csv' using ($5/1000):($4/$5*1000) with line title "Recoved/Kpkt" , \
'output.csv' using ($5/1000):9 with boxes title "Lost/sec"
