#!/bin/bash

base=1400
bound=8000

for sell in {6000,8000,10000,12000,15000}
do
	diff=`echo "$sell-$bound" | bc -l`
	base_part=$bound
	if (( $sell < $bound )); then diff="0"; base_part=$sell; fi
	total=`echo "$base + $base_part*0.05 + $diff*0.1" | bc -l`
	total1=`echo "1500 + $sell*0.05" | bc -l`
	total2=`echo "1200 + $sell*0.1" | bc -l`
	perc=`echo "scale=3; 1-$total/$sell" | bc -l`
	echo "$sell ---> $total1, $total1, $total"
done
