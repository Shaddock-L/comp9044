#!/usr/bin/env python3
import sys

if len(sys.argv) != 3:
    print(f'Usage: {sys.argv[0]} <infile> <outfile>', file=sys.stderr)
    sys.exit(1)

filename1 = sys.argv[1]
filename2 = sys.argv[2]
temp=[]

with open(filename1, "r") as f:
    for line in f:
        temp.append(line)

temp.reverse()
f = open(filename2, "w")
for i in range(len(temp)):
    f.write(temp[i])

f.close()