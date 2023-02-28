#!/usr/bin/env python3

import sys
import re

#file = sys.stdin.readlines()
file = sys.stdin
cnt = 0
for f in file:
    if re.search(r'\|3711/',f):
        cnt +=1

print(cnt)