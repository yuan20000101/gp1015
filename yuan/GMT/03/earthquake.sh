out_ps=report.ps
input_list=eq.list
cpt=04_report.cpt
gmt makecpt -T0/315/15 -Crainbow -Z > $cpt
 
gmt set PS_MEDIA A4
 
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 
# Main map
gmt psbasemap -R119/123/21/26 -Jm3 -BwEsN -B1xa1f1 -Bya100f20 -G0/250/250 -X-0.5 -Y5 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -Ia -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{if ($4>=3 && $4<5) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.1 -C$cpt -W0.01 -O -K >> $out_ps
awk '{if ($4>=3 && $4<6) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K -W0.01 >> $out_ps
awk '{if ($4>=3 && $4<7) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.3 -C$cpt -O -K -W0.01 >> $out_ps
echo 121.29 22.83 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_ps
echo "121.29 22.7 M:4.6 Depth:5.9km" | gmt pstext -R -J -F+f,Helvetica-Bold,black -O -K >> $out_ps

gmt psbasemap -R119/123/0/315 -Jx3/-0.01 -Bxa1f1 -Bya100f20 -X0 -Y-5 -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.05 -O -C$cpt -K >> $out_ps
awk '{if ($4>=3 && $4<5) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.1 -O -C$cpt -W0.01 -K >> $out_ps
awk '{if ($4>=3 && $4<6) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.2 -O -C$cpt -K -W0.01>> $out_ps
awk '{if ($4>=3 && $4<7) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.3 -O -C$cpt -K -W0.01>> $out_ps
echo 121.29 5.9 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_ps

gmt psbasemap -R0/315/21/26 -Jx0.01/3.25 -Bxa1f1 -Bya100f20 -X14 -Y5 -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{if ($4>=3 && $4<5) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.1 -C$cpt -W0.01 -O -K >> $out_ps
awk '{if ($4>=3 && $4<6) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -W0.01 -O -K >> $out_ps
awk '{if ($4>=3 && $4<7) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.3 -C$cpt -O -W0.01 -K >> $out_ps
echo 5.9 22.83 | gmt psxy -R -J -Sa0.7 -W0.01 -G255/0/0 -O -K >> $out_ps

# end gmt session
gmt psxy -R -J -O -T >> $out_ps
 
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg
