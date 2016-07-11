#!/bin/bash

#base sel-up64 MCR-2 MCR-2 sel-up64 MCR-2' MCR-4'
declare -a arr_energy=(46.440 39.699 41.534 40.638 39.699 50.09 60.853)
declare -a arr_performance=(1.0 1.195 1.187 1.226 1.195 1.187 1.226)

base_edp=`echo "scale=3; ${arr_energy[0]}/${arr_performance[0]}" | bc -l`
for (( ind=0; ind<7; ind++ ))
do
	energy=${arr_energy[$ind]}
	perf=${arr_performance[$ind]}

	edp=`echo "scale=3; $energy/$perf" | bc -l`
	norm_edp=`echo "scale=3; $edp/$base_edp" | bc -l`
	echo "$edp - $norm_edp"
done
