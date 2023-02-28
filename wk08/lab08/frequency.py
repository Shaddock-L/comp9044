#!/usr/bin/env python3
import sys
import re
import os
import collections
# if len(sys.argv) != 4:
#     print(f"usage: {sys.argv[0]} <word> < <path>", file = sys.stderr)
#     sys.exit(1)

word = sys.argv[1]

path = "./lyrics"
filenames = os.listdir(path)

freq = collections.defaultdict(list)


for name in filenames:
    temp = []
    cnt = 0
    f = open(path + '/' + name, 'r')
    for ele in f:
        c = re.findall('[a-zA-Z]+', ele)
        for s in c:
            temp.append(s)
    f.close()
    total_cnt = len(temp)
    
    for s in temp:
        if re.match(f'^{word}$', s, re.I):
            cnt += 1
    pure_name = re.sub(r'_', ' ', name[:-4])
    freq[pure_name] = [cnt, total_cnt ,float(cnt / total_cnt)]

keys = list(freq.keys())
keys.sort()
for k in keys:
    print(f'{freq[k][0]:4}/{freq[k][1]:6} = {freq[k][2]:.9f} {k}')


