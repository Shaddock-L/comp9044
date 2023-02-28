#!/usr/bin/python3
import sys

if len(sys.argv) != 4:
    print(f'Usage: {sys.argv[0]} <start_num> <end_num> <outfile>', file=sys.stderr)
    sys.exit(1)

start = int(sys.argv[1])
end = int(sys.argv[2])
filename=sys.argv[3]

f = open(filename,"w")

for i in range(start, end+1):
    f.write(f'{i}\n')

f.close()
