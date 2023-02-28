#!/bin/dash

CODE="$1"

curl --location --silent http://www.timetable.unsw.edu.au/current/"$CODE"KENS.html | 
grep -E ""$CODE"[0-9]{4}.html\">.+?<" | grep -E -v ""$CODE"[0-9]{4}\.html\">"$CODE"[0-9]{4}<" |
cut -d'"' -f4,5 | sed 's/\.html\">/ /g' | sed 's/<.*//g'|sort|uniq