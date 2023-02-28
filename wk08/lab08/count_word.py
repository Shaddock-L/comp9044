#!/usr/bin/env python3
import sys
import re

# if len(sys.argv) != 4:
#     print(f"usage: {sys.argv[0]} <word> < <path>", file = sys.stderr)
#     sys.exit(1)

word = sys.argv[1]
f = sys.stdin.readlines()

temp = []
cnt = 0
for ele in f:
    c = re.findall('[a-zA-Z]+', ele)
    for s in c:
        temp.append(s)

for s in temp:
    if re.match(f'^{word}$', s, re.I):
        cnt += 1
    


print(f'{word} occurred {cnt} times')
