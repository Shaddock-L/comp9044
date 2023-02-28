#!/bin/dash
cut -d'|' -f1,2 |sort -t'|' -k2 | cut -d'|' -f2 | uniq -c | grep -E '^.*2 .*' | sed 's/^.*[0-9]* //g'
