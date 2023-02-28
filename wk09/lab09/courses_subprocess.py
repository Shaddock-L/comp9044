#! /usr/bin/env python3

import subprocess
import re
import sys
CODE = sys.argv[1]

resp = subprocess.run(f"curl --location --silent http://www.timetable.unsw.edu.au/current/{CODE}KENS.html",\
    capture_output=True, text=True, shell = True)

#contents = resp.stdout.decode('utf-8').split('\n')
contents = resp.stdout.split('\n')
out = []
for cont in contents:
    if re.search(rf"{CODE}[0-9][0-9][0-9][0-9]\.html", cont):
        if not re.search(rf"{CODE}[0-9][0-9][0-9][0-9]\.html\"\>{CODE}", cont):
            temp = re.sub(' *\<td class=\"data\"\>\<a href=\"', '', cont)
            temp = re.sub('\.html\"\>', ' ', temp)
            temp = re.sub('\<\/a\>\<\/td\>', '', temp)
            out.append(temp)

out  = list(set(out))
out.sort()
for info in out:
    print(info)