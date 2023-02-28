#!/usr/bin/env python3

import sys
import re
import subprocess

f = sys.stdin


for line in f:
    comm = re.findall(r'<(!?)(.*?)>',line)
    for cmds in comm:
        if cmds[0] == "!":
            
            temp = ''.join(cmds).strip()
            temp = "<"+temp
            temp = temp + ">"
            # print(temp)
            # print(line)
            cont = (subprocess.run(cmds[1], shell = True, capture_output=True, text = True).stdout)
            # if re.search(temp, line):
            #     print("got it")
            # line = re.sub(temp,\
            #     cont, line)
            line = line.replace(temp,cont)

        else:
            temp = ''.join(cmds).strip()
            temp = "<"+temp
            temp = temp + ">"
            # line = re.sub(temp,\
            #     subprocess.run(f"cat {cmds[1]}", shell = True, capture_output=True, text = True).stdout,\
            #         line)

            line = line.replace(temp, subprocess.run(f"cat {cmds[1]}", shell = True, capture_output=True, text = True).stdout)
    print(line, end= '')







# for line in f:
#     cmds = re.findall(r'<(!?)(.*?)>',line)
#     if len(cmds) == 0:
#         #print("no neeed")
#         print(line, end = '')
#         continue
#     if cmds[0][0] == '!':
#         res = subprocess.run(f"{cmds[0][1]}"  ,\
#     capture_output=True, text = True, shell = True).stdout
#     else:
#         #print(cmds[0][1])
#         res = subprocess.run(f"cat {cmds[0][1]}", capture_output=True, text = True, shell = True).stdout.strip()
#     temp = ''.join(cmds[0]).strip()
#     temp = "<"+temp
#     temp = temp + ">"
    
#     output = re.sub(temp, res, line)
#     print(output, end= '')
