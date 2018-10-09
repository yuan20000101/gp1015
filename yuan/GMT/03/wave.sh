out_ps=wave.ps
in_data=wave.txt

psxy -R0/120/-170000/170000 -B20/50000NSWE -Jx0.1/0.00001 $in_data -W1 -Xc -Yc -K> $out_ps
echo 28.378000 167232.687500| psxy -J -R -B -O -Sc1 -W1/255/0/0>> $out_ps
