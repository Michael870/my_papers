#!/bin/bash

function cal_v_min
{
	local Vnoise=$1
	local Vnoise=`echo "scale=5; $Vnoise/1000" | bc -l`
	local Vdd=$2
	local Cbl=85; local Ccell=24
	local Vcell=`echo "scale=4; ($Cbl+$Ccell)/$Ccell*$Vnoise + 0.5*$Vdd" | bc -l`
	local Vcell=`echo "scale=4; $Vcell/$Vdd" | bc -l`

	echo "$Vnoise : $Vcell"
}

noise_vdds="25-1.5 30-1.5 35-1.5 40-1.5 50-1.0 60-1.0 70-1.0 80-1.0"
for noise_vdd in $noise_vdds
do
	Vnoise=`echo $noise_vdd | cut -f1 -d'-'`
	Vdd=`echo $noise_vdd | cut -f2 -d'-'`
#cal_v_min $Vnoise $Vdd
done

#exit

v_max=0.975
v_min=0.73

REF=64
leak_speed=`echo "scale=5; ($v_max - $v_min)/$REF" | bc -l`
ref_gaps="8 16 16 24"
ref_gaps="16 16 16 8 8"

passed_time=0
for ref_gap in $ref_gaps
do
	passed_time=$(( $passed_time + $ref_gap ))
	echo "===> ref_gap= $ref_gap"
	v_leak=`echo "scale=3; $leak_speed*$passed_time" | bc -l`
	v_now=`echo "scale=3; ($v_max-$v_leak)" | bc -l`

	echo "$passed_time : $v_now"
done
