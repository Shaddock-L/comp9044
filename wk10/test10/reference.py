#!/usr/bin/env python3
import sys
f = sys.stdin.readlines()

temp = []
cnt = 1
dic = {}
for line in f:
    cont = line.strip()
    temp.append(cont)
    dic[cnt] = cont
    cnt += 1

for i in range(len(temp)):
    ele = temp[i]
    if ele[0] == '#':
        pos = int(ele[1:])
        temp[i] = dic[pos]
for k in temp:
    print(k)
