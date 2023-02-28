#!/usr/bin/env python3
import sys
import re
ans = []

if len(sys.argv) == 1:
    print()
else:
    for word in sys.argv[1:]:
        if re.search(r'[aeiouAEIOU]{3}', word):
            ans.append(word)
    if len(word) > 0:
        print(' '.join(ans))
    else:
        print()