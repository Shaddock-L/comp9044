#!/usr/bin/python3
import sys

if len(sys.argv) != 3:
    print(f'Usage: {sys.argv[0]} xxxxx', file=sys.stderr)
    sys.exit(1)

wanted = int(sys.argv[1])
filename = sys.argv[2]

count = 1

with open(filename, "r") as f:
    for line in f:
        if(count == wanted):

            print(line)
            break;
        else:
            count +=1
