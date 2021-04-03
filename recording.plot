set autoscale

set ytic auto
set y2tic auto

set y2r[0:]
set xtics auto

set key right center # legend placement
unset key

stats filename using 1 nooutput name 'TIME_'
set xlabel sprintf("Times (s), TOTAL: %.2f", TIME_max) font ",12"

stats filename using 5 nooutput name 'CPU_'
set ylabel sprintf("CPU perc, MAX: %.2f", CPU_max) tc lt 1 font ",12"

stats filename using 7 nooutput name 'MEM_'
set yr[0:100]
set y2label sprintf("MEM (kb), MAX %i kb", MEM_max) tc lt 20 font ",12" offset 1,0

plot    filename using 1:5 title "CPU" with l lt 1 lw 2, \
        "" using 1:7 title "RSS" with l lt 20 lw 2 axes x1y2

