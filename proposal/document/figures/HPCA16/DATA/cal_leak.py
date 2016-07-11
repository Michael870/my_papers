import numpy as np
import math

Vdd = 1.5 #Vdd
full_v = 1*Vdd #voltage right after refresh
last_v = 0.59*Vdd #voltage right before refresh

RC = 3
tWR = 15
tCK = 1.25
ARR_LEN = int(math.ceil(5*RC/tCK))
COUNTERS_tWR = [0]*(ARR_LEN+1)

RAS_MAX = 28 #spec
RAS_MIN = 17 #tRCD+tRP
COUNTERS_tRAS = [0]*(RAS_MAX+1)

REF_CMDS = 8192 #num of REF cmds sent in tREF
STD_REF = 64
my_ref = 64

out_file = open("ref_leak.dat", "w")

#calculate the remaining voltage of each refresh operation
for ref in range(REF_CMDS):
	per_leak = (full_v - last_v)/(my_ref/STD_REF)/REF_CMDS #leaked voltage per refresh command
	remain_v = full_v - per_leak*ref #remaining voltage (in v)
	remain_v_Vdd = remain_v/Vdd #remaining voltage (in Vdd)
	if remain_v_Vdd == 1:
		t = 5*RC;
	else:
		t = -RC*np.log(1-remain_v_Vdd) #charging time (in ns)
	if t > tWR:
		t = tWR
	t_wr = int(math.ceil(t/tCK))
	COUNTERS_tWR[t_wr] += 1

	#for tRAS
	if remain_v_Vdd <= 0.925: t_ras = 17
	elif remain_v_Vdd > 0.925 and remain_v_Vdd <= 0.94: t_ras = 18
	elif remain_v_Vdd > 0.94 and remain_v_Vdd <= 0.95: t_ras = 19
	elif remain_v_Vdd > 0.95 and remain_v_Vdd <= 0.958: t_ras = 20
	elif remain_v_Vdd > 0.958 and remain_v_Vdd <= 0.963: t_ras = 21
	elif remain_v_Vdd > 0.963 and remain_v_Vdd <= 0.97: t_ras = 22
	elif remain_v_Vdd > 0.97 and remain_v_Vdd <= 0.975: t_ras = 23
	elif remain_v_Vdd > 0.975 and remain_v_Vdd <= 0.978: t_ras = 24
	elif remain_v_Vdd > 0.978 and remain_v_Vdd <= 0.98: t_ras = 25
	elif remain_v_Vdd > 0.98: t_ras = 28
	COUNTERS_tRAS [t_ras] += 1

	out_file.write("%d\t%.3fVdd\t%d\t%d\n" % (ref,remain_v_Vdd, t_wr, t_ras))

out_file.close()

check_wr_sum = 0
for ind in reversed(range(ARR_LEN+1)):
	check_wr_sum += COUNTERS_tWR[ind]
	if COUNTERS_tWR[ind] > 0:
		print "t_wr=%d, num=%d, sum=%d" % (ind, COUNTERS_tWR[ind], check_wr_sum)

print check_wr_sum

check_ras_sum = 0
for ind in reversed(range(RAS_MAX+1)):
	check_ras_sum += COUNTERS_tRAS[ind]
	if COUNTERS_tRAS[ind] > 0:
		print "t_ras=%d, num=%d, sum=%d" % (ind, COUNTERS_tRAS[ind], check_ras_sum)
