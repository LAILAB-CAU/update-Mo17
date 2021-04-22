import sys,re

dictReadSsrLen = {}
with open(sys.argv[1],'r') as rmbed:
    for line in rmbed:
        if len(line.strip().split()) == 5:
            dictReadSsrLen.setdefault(line.strip().split()[0],0)
            dictReadSsrLen[line.strip().split()[0]] += int(line.strip().split()[2]) - int(line.strip().split()[1])
dictReadLen = {}
with open(sys.argv[2],'r') as readlen:
    for line in readlen:
        dictReadLen.setdefault(line.strip().split()[0],line.strip().split()[-1])

for read in sorted(dictReadSsrLen.items(), key = lambda x:x[1],reverse=True):
    if read[1] >= 10000:
        print(read[0] + "\t" + dictReadLen[read[0]])
