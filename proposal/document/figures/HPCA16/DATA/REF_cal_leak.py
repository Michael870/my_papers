import numpy as np
import math

Vdd = 1.5 #Vdd
full_v = 1*Vdd #voltage right after refresh
last_v = 0.59*Vdd #voltage right before refresh

tWR = 15 #standard tWR, 15ns
RC = tWR/5 #5tau to fully charge the cell, one tau=tWR/5
tCK = 1.25 #DDR3-1600, 800 MHz, 1.25ns tCK
ARR_LEN = int(math.ceil(tWR/tCK)) #max tWR in cycles
COUNTERS = [0]*(ARR_LEN+1) #counters to counter the number of ref_cmds in each value bin

REF_CMDS = 8192 #num of REF cmds sent in tREF
STD_REF = 64 #standard refresh rate, 64ms
my_ref = 64 #designed refresh rate, 64ms

out_file = open("ref_leak.dat", "w")

#calculate the remaining voltage of each refresh operation
for ref in range(REF_CMDS):
	per_leak = (full_v - last_v)/(my_ref/STD_REF)/REF_CMDS #leaked voltage per refresh command
	remain_v = full_v - per_leak*ref #remaining voltage (in v)
	remain_v_Vdd = remain_v/Vdd #remaining voltage (in Vdd)
	t = tWR
	if remain_v_Vdd < 1:
		t = -RC*np.log(1-remain_v_Vdd) #charging time (in ns)
	if t > tWR: #max is tWR
		t = tWR
	cycle = int(math.ceil(t/tCK)) #calculate in cycles
	COUNTERS[cycle] += 1 #do the counting

	out_file.write("%d\t%.3fVdd\t%d\n" % (ref,remain_v_Vdd, cycle))

out_file.close()

#output the counter info
check_sum = 0
for ind in reversed(range(ARR_LEN+1)):
	check_sum += COUNTERS[ind]
	if COUNTERS[ind] > 0:
		print "cycle=%d, num=%d" % (ind, COUNTERS[ind])

print check_sum
