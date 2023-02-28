#!/usr/bin/env python3
import sys
import re

pat = sys.argv[1]
file = sys.argv[2]

with open(file,'r') as f:
    for line in f:
        if re.search(rf'{pat}', line):
            print(line, end = '')
