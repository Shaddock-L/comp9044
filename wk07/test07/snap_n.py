#!/usr/bin/env python3

import sys

n = len(sys.argv)

if(n != 2):
    print(f'usage: {sys.argv[0]} <number>', file = sys.stderr)
    sys.exit(1)

num = int(sys.argv[1])
line = sys.stdin.readline()
dic = dict({line:1})
cnt = 0
while 1:
    line = sys.stdin.readline()
    if line not in dic:
        dic[line] = 1
    else:
        dic[line] += 1
        if(dic[line] == num and line != ""):
            print(f'Snap: {line}', end = '')
            break
    cnt +=1 
    if cnt > 100:
        break