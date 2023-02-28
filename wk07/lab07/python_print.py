#!/usr/bin/env python3
import sys
import os

if(len(sys.argv) == 1):
    print(f"error: {sys.argv[0]} needs filenames", file=sys.stderr)
    sys.exit(1)


os.execl("/import/ravel/2/z5285799/Desktop/comp9044/wk07/lab07/", sys.argv[0], sys.argv[1])
content = sys.argv[1]
print(content)


