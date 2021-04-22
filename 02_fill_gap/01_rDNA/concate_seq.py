import sys,re

dictRead = {}
readname = ''
with open(sys.argv[1],'r') as read:
	for line in read:
		if line.startswith('>'):
			readname = line.strip().split()[0][1:]
			dictRead.setdefault(readname,'')
		else:
			dictRead[readname] = dictRead[readname] + line.strip()

dictfinal = {}
contigname = ''
with open(sys.argv[2],'r') as infor:
	for line in infor:
		contigname = 'rDNA_asm'
		dictfinal.setdefault(contigname,'')

		theReadName = line.strip().split()[0]
		theReadS = int(line.strip().split()[1]) - 1
		theReadE = int(line.strip().split()[2])
		theReadD = line.strip().split()[3]
		if theReadD == 'P':
			dictfinal[contigname] = dictfinal[contigname] + dictRead[theReadName][theReadS:theReadE]
		else:
			addseq = dictRead[theReadName][theReadS:theReadE][::-1]
			addseqstr = addseq.upper()
			addseqstr = addseqstr.replace('A', 't')
			addseqstr = addseqstr.replace('T', 'a')
			addseqstr = addseqstr.replace('C', 'g')
			addseqstr = addseqstr.replace('G', 'c')
			dictfinal[contigname] = dictfinal[contigname] + addseqstr.upper()

for key,value in dictfinal.items():
	print('>'+key)
	print(value)
