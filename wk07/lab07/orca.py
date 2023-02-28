#!/usr/bin/env python3
import sys
import re


if(len(sys.argv) == 1):
    print(f"error: {sys.argv[0]} needs filenames", file=sys.stderr)
    sys.exit(1)
    
file_list=[]
cnt = 0
for i in range(1, len(sys.argv)):
    file_list.append(sys.argv[i])

for i in range(len(file_list)):
    with open(file_list[i], "r") as f:
        for line in f:
            if re.search("Orca", line):
                cnt += int(line.split()[1])

print(f'{cnt} Orcas reported')