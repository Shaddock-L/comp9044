#!/usr/bin/env python3
import sys
import re
import os
import collections
import math
# if len(sys.argv) != 4:
#     print(f"usage: {sys.argv[0]} <word> < <path>", file = sys.stderr)
#     sys.exit(1)

words = sys.argv[1:]

path = "./lyrics"
filenames = os.listdir(path)

freq = collections.defaultdict(float)


for word in words:
    for name in filenames:
        f = open(path + '/' + name, 'r')
        temp = []
        cnt = 0
        for ele in f:
            c = re.findall('[a-zA-Z]+', ele)
            for s in c:
                temp.append(s)
        total_cnt = len(temp)
        for s in temp:
            if re.match(f'^{word}$', s, re.I):
                cnt += 1
        pure_name = re.sub(r'_', ' ', name[:-4])
            #freq[pure_name] = [cnt+1, total_cnt ,float(cnt / total_cnt)]
        prob =float((cnt + 1)/ (total_cnt))
        log_prob = math.log(prob)
        freq[pure_name] += (log_prob)
        f.close()
    
    
keys = list(freq.keys())
keys.sort()
for k in keys:
    print(f'{freq[k]:10.5f} {k}')



