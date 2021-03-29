import sys,re


with open(sys.argv[1], 'r') as mapin:
    for line in mapin:
        if line.startswith('#'):
            continue
        if int(line.strip().split()[8]) - int(line.strip().split()[7]) < 10000:
            continue
        if int(line.strip().split()[1]) < 50000:
            continue
        if float(int(line.strip().split()[3]) - int(line.strip().split()[2]))/float(line.strip().split()[1]) > 0.85:
            if int(line.strip().split()[1]) >= 100000:
                print(line.strip())
            continue
        
        if int(line.strip().split()[7]) <= 5000:
            #print(line.strip())
            if line.strip().split()[4] == '+':
                if int(line.strip().split()[1]) - int(line.strip().split()[3]) <= 5000:
                        print(line.strip())
            elif line.strip().split()[4] == '-':
                    if int(line.strip().split()[2]) <= 5000:
                        print(line.strip())
        if int(line.strip().split()[6]) - int(line.strip().split()[8]) <= 5000:
           # print(line.strip())
            if line.strip().split()[4] == '+':
                if int(line.strip().split()[2]) <= 5000:
                    print(line.strip())
            elif line.strip().split()[4] == '-':
                if int(line.strip().split()[1]) - int(line.strip().split()[3]) <= 5000:
                    print(line.strip())
