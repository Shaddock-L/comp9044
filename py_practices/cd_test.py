#!/usr/bin/env python3

import sys
import re

n = len(sys.argv)

if(n != 1):
    print(f'Usage: {sys.argv[0]}', file=sys.stderr)
    sys.exit(1)

def track_max(line):
    max_val = max([int(x) for x in re.findall('\d+', line)])
    return max_val

lines = sys.stdin.readlines()
dic = dict()
for l in lines:
    max_v = track_max(l)
    if max_v not in dic:
        dic[max_v] = [l]
    else:
        dic[max_v].append(l)
key = list(dic.keys())
max_key = max(key)

for out in dic[max_key]:
    print(out, end='')



