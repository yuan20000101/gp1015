psbasemap -Ba1f1::EwNs -Jm2 -R119/123/21/26 -G0/250/250 -K -Yc-Xc> report.ps
pscoast -J -B -R -O -K -Di -W1 -G250/250/0>> report.ps
makecpt -T0/315/15 -Cgebco > depth.cpt
awk '{ if ($4<3) print $1, $2, $3}' eq.list| psxy -J -B -R -Sc0.01 -W0.01 -Cdepth.cpt -K -O>> report.ps
awk '{ if ($4<=3 && $4>3) print $1, $2, $3}' eq.list| psxy -J -B -R -Sc0.1 -W0.01 -Cdepth.cpt -K -O>> report.ps
awk '{ if ($4<=5 && $4>4) print $1, $2, $3}' eq.list| psxy -J -B -R -Sc0.3 -W0.01 -Cdepth.cpt -K -O>> report.ps
awk '{ if ($4>5) print $1, $2, $3}' eq.list| psxy -J -B -R -Sc0.6 -W0.01 -Cdepth.cpt -O>> report.ps







