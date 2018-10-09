echo -40 90| psxy -R-60/60/-80/150 -JX6.0 -St1 -Ba20g10/a30g15 -G255/127/0 -W2/100/100/0 -K> test.ps 
echo 0 0| psxy -R-60/60/-80/150 -JX6.0 -Sc1 -Ba20g10/a30g15 -G100/0/100 -W2/100/0/100 -K -O>> test.ps 
echo 40 30| psxy -R-60/60/-80/150 -JX6.0 -Ss1 -Ba20g10/a30g15 -G0/100/100 -W2/0/100/100 -O >> test.ps
