#!/usr/bin/env python3
import sys
import re
f = sys.stdin.readlines()

temp = []

for line in f:
    cont = line
    l = re.findall(r"\d+\.?\d*", cont)
    for n in l:
        cont = re.sub(n, f"{int(round(float(n),0))}", cont)
    temp.append(cont)

for k in temp:
    print(k, end= '')