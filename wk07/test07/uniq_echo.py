#!/usr/bin/env python3

import sys

n = len(sys.argv)

if(n < 2):
    print(f'usage: {sys.argv[0]} <content>', file = sys.stderr)
    sys.exit(1)

output = []

temp = sys.argv[1:]
for s in temp:
    if s not in output:
        output.append(s)

print(' '.join(output))