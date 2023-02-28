#!/usr/bin/env python3
import sys
import re

if(len(sys.argv) == 1):
    print(f"error: {sys.argv[0]} needs filenames", file=sys.stderr)
    sys.exit(1)
    
filename = sys.argv[1]
cnt = 0
with open(filename, "r", encoding='utf-8') as f:
    for line in f:
        temp = re.findall('[\d]+', line)
        temp = [int(x) for x in temp]
        cnt += sum(temp)
print(cnt)