#!/usr/bin/env python3
import sys
dic = {}

for line in sys.stdin:

    word = line.strip()
    temp = list(word)
    temp = sorted(temp)
    new_s = ''.join(temp)
    if new_s not in dic:
        dic[new_s] = [word]
    else:
        dic[new_s].append(word)

ret = sorted([dic[k] for k in dic])
ret = sorted(ret, key = lambda x: len(x), reverse = True)
for l in ret:
    output_s = ' '.join(l)
    print(f"{len(l)} {output_s}")
