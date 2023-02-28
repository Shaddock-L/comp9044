#! /usr/bin/env python3
import re
import sys
import urllib.request
import bs4 as BeautifulSoup
from bs4 import NavigableString, Tag
import re

CODE = sys.argv[1]

IGNORE_WEBPAGE_ELEMENTS = set("[document] head meta style script title".split())
#CODE = 'VISN'
url = f"http://www.timetable.unsw.edu.au/2022/{CODE}KENS.html"
response = urllib.request.urlopen(url)
webpage = response.read().decode()
soup = BeautifulSoup.BeautifulSoup(webpage, "html5lib")

temp = []
for element in soup.findAll(text=True):
        parent = element.parent.name.lower()
        if parent in IGNORE_WEBPAGE_ELEMENTS:
            continue
        # remove empty lines and leading whitespace
        #text = re.sub(r"\n\s+", "\n", element)
        text = element
        text = text.strip()
        if text:
            temp.append(text)

out = []
for i in range(len(temp)):
    if re.match(rf'^{CODE}[0-9][0-9][0-9][0-9]', temp[i]):
        out.append(temp[i] + ' ' + temp[i+1])
        #out.append(temp[i+1])
        i += 1
out  = list(set(out))
out.sort()
for info in out:
    print(info)


"""
contents = response.read().decode().split('\n')
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
"""