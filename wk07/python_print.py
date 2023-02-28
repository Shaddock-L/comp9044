#!/usr/bin/env python3
import sys
import os

content = sys.argv[1]

print(content)
#os.execl(sys.executable, "python3", sys.argv[0],sys.argv[1])

cnt = 0

while cnt < 2:
    cnt +=1
    def exeFun():
        os.execl(sys.argv[0],sys.argv[0],sys.argv[1])
        
    exeFun()


