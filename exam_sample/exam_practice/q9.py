#!/usr/bin/env python3
import subprocess
import sys
import re
file = sys.stdin

for line in file:
    comm = re.findall(r'<(!?)(.*)>',line)
    for cmds in comm:
        if cmds[0] == "!":
            # commands
            
            temp = ''.join(cmds).strip()
            temp = "<"+temp
            temp = temp + ">"
            cont = subprocess.run(cmds[1],shell=True, text = True, capture_output=True).stdout
            
            line = line.replace(temp, cont)
        else:
            temp = ''.join(cmds).strip()
            temp = "<"+temp
            temp = temp + ">"
            cont = subprocess.run(f"cat {cmds[1]}",shell=True, text = True, capture_output=True).stdout
            line = line.replace(temp, cont)
    print(line, end = '')