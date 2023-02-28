#!/usr/bin/env python3

import sys
import re
limit = int(sys.argv[1])

count = 0
cur_max = 0
temp = set()
while 1:
    try:
        cont = input().strip()
        cont = cont.lower()
        cont = re.sub(r'\s*', ' ', cont)
        temp.add(cont)
        cur_max = len(temp)
        count += 1
        if cur_max == limit:
            break
    except Exception:
        break

if cur_max < limit:
    print(f'End of input reached after {count} lines read - {limit} different lines not seen.')
else:
    print(f'{limit} distinct lines seen after {count} lines read.')
