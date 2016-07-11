import numpy as np
import math
import sys

tRAS = -5.0*42/np.log(1-0.975)
tWR = -5.0*25/np.log(1-0.975)

#levels = [0.975, 0.95, 0.925, 0.90, 0.875, 0.85, 0.825, 0.80, 0.775, 0.75, 0.725]
#levels = [0.975, 0.95, 0.889, 0.87,0.86,0.85,0.827]
levels = [0.975, 0.936, 0.897, 0.858]
levels = [0.975, 0.92, 0.86, 0.80, 0.77, 0.73]
#tWR = 25
#tRAS = 131
for level in levels:
	RC_twr = tWR/5.0
	RC_tras = tRAS/5.0
	tWR_new = math.ceil(-RC_twr*np.log(1-level)) #charging time (in ns)
	tRAS_new = math.ceil(-RC_tras*np.log(1-level)) #charging time (in ns)
	print "level=%f, tRAS_new=%d/%d, tWR_new=%d/%d" % (level, tRAS_new, tRAS, tWR_new, tWR)

sys.exit(0)

tWRs = [17, 18, 19, 20, 25]
for tWR in tWRs:
	RC = tWR/5.0
	remain_v_Vdd = 0.80
	tWR_new = math.ceil(-RC*np.log(1-remain_v_Vdd)) #charging time (in ns)
	print "tWR=%d, tWR_new=%d" % (tWR, tWR_new)
