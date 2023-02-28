#!/usr/bin/env python3

import sys

fname = sys.argv[1]
temp = []

with open(fname, 'r') as f:
    for line in f:
        temp.append(line)

temp = sorted(temp)
temp = sorted(temp, key = lambda x : len(x))

for text in temp:
    print(text, end = '')



