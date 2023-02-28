#!/usr/bin/env python3
import sys
import re

file = sys.stdin.readlines()

for line in file:
    temp = line.split("|")
    name = re.fullmatch(r"(.*), (.*?)(\s*)", temp[2])
    last = name.group(1)
    first = name.group(2)
    space = name.group(3)

    print(f'{temp[0]}|{temp[1]}|{first} {last}{space}|{temp[3]}|{temp[4]}', end = '')







# for line in file:
#     temp = line
#     b = re.search(r'\w{4}\d{4}\|\d{7}\|(.*), (.*) \|?', temp)
#     last = b.group(1)

#     first = b.group(2)
#     first = re.sub(' {2,}', '', first)

#     mid1 = "#"*len(last)
#     temp = re.sub(last, mid1, temp)
#     temp = re.sub(first, last, temp)
#     temp = re.sub(mid1, first, temp)
#     temp = re.sub(',', '', temp)
#     print(temp, end = '')
