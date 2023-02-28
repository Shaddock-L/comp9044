#!/usr/bin/env python3
import sys
fname = sys.argv[1]

temp = []

with open(fname, 'r') as f:
    for line in f:
        temp.append(line)

n = len(temp)
if n == 0:
    pass
else:
    if(n%2 == 0):
        print(temp[n//2 - 1] , end = '')
        print(temp[n//2], end = '')
    else:
        print(temp[n//2], end = '')
