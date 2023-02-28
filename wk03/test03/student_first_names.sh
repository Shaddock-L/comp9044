#!/bin/dash

cut -d'|' -f2,3| sort -k1 | uniq|cut -d'|' -f2 |cut -d' ' -f2 |sort


