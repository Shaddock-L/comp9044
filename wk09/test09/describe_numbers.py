#!/usr/bin/env python3
import sys
arg = sys.argv[1:]
number = [int(x) for x in arg]

num = [x for x in number]
mode = num[0]
number = sorted(number)
count = len(number)
uni_num = set(number)
unique = len(uni_num)
minimum = min(number)
maximum = max(number)
mean = float(sum(number)/count)

if mean == int(mean):
    mean = int(mean)

median = number[int(count/2)]
product = 1
mode_lsit = []
freq = 0
dic = {}
for n in num:
    if n not in dic:
        dic[n] = 1
    else:
        dic[n] += 1
    if dic[n] > freq:
        freq = dic[n]
    product *= n

sum = sum(number)

for k in num:
    if dic[k] == freq:
        mode = k
        break



print(f'count={count}')
print(f'unique={unique}')
print(f'minimum={minimum}')
print(f'maximum={maximum}')
print(f'mean={mean}')
print(f'median={median}')
print(f'mode={mode}')
print(f'sum={sum}')
print(f'product={product}')


