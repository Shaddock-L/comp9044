#!/usr/bin/env python3
import sys
import re
offset = int(sys.argv[1]) % 26

while 1:
    try:

        cont = input()
        res = ""
        for c in cont:
            if ord(c) >= 65 and ord(c) <= 90:
                #upper case
                new_c = ord(c) + offset
                if new_c > ord('Z'):
                    new_c = new_c - ord('Z') + ord('A') - 1
                res += chr(new_c)
            elif ord(c) >= 97 and ord(c) <= 122:
                #lower case
                new_c = ord(c) + offset

                if new_c > ord('z'):
                    new_c = new_c - ord('z') + ord('a') - 1
                res += chr(new_c)
                
            else:
                res += c
        
        print(res)


    except Exception:
        break