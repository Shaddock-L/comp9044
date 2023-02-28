#!/usr/bin/python3
import sys

if len(sys.argv) != 2:
    print(f'Usage: {sys.argv[0]} <start_num> <end_num> <outfile>', file=sys.stderr)
    sys.exit(1)

filename = sys.argv[1]
temp=[]

with open(filename, "r") as f:
    for line in f:
        temp.append(line)

temp.reverse()
f = open(filename, "w")
for i in range(len(temp)):
    f.write(temp[i])

f.close()



