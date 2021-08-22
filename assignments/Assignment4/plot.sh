input=5
max=6000

echo "for plotting data using gnuplot"
gnuplot <<EOF
set terminal png font 'Times New Roman'
set boxwidth 0.25
set style fill solid
set output 'image.png'
set yrange [0:$max]
set xtics rotate
set xlabel 'Operating System'
set ylabel 'No of Vulnerabilities'
set title 'OS Vulnerabilities"
plot 'plot.txt' u 1:3:xtic(2) with boxes