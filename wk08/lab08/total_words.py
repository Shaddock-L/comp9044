#!/usr/bin/env python3
import sys
import re

f = sys.stdin.readlines()

cnt = 0
for ele in f:
    c = re.findall('[a-zA-Z]+', ele)
    cnt += len(c)

print(f'{cnt} words')