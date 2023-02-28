#!/usr/bin/env python3
import sys
import re
import os
import collections
import math
import time
# if len(sys.argv) != 4:
#     print(f"usage: {sys.argv[0]} <word> < <path>", file = sys.stderr)
#     sys.exit(1)

start = time.time()
songs= sys.argv[1:]
map_arg = {}
for i in range(len(songs)):
    map_arg[i] = songs[i]
words_data = []
all_words = set()
prob = collections.defaultdict(lambda: collections.defaultdict(float))

file_num = 0
for file in songs:
    temp = []
    with open(file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            for x in re.findall('[a-zA-Z]+', line):
                temp.append(x)
                all_words.add(x)
    words_data.append(temp)
    

path = "./lyrics"
filenames = os.listdir(path)

art = [re.sub(r'_', ' ', x[:-4]) for x in filenames]

song_art = {x : [0.0] * 5 for x in art}


#for words in words_data:
for i in range(len(words_data)):
    words = words_data[i]
    for word in words:
        for name in filenames:
            pure_name = re.sub(r'_', ' ', name[:-4])
            if word in prob[pure_name]:
                song_art[pure_name][i] += prob[pure_name][word]
            else:    
                f = open(path + '/' + name, 'r')
                cnt = 0
                total_cnt = 0
                for ele in f:
                    c = re.findall('[a-zA-Z]+', ele.lower())
                    cnt += c.count(word.lower())
                    total_cnt += len(c)
                        
                probablity =float((cnt + 1)/ (total_cnt))
                log_prob = math.log(probablity)
                prob[pure_name][word] = log_prob
                song_art[pure_name][i] += (log_prob)
                f.close()
            

res = {}    


for i in range(len(words_data)):
    cur_max = -999999
    for k in song_art:
        if song_art[k][i] > cur_max:
            res[map_arg[i]] = (k, round(song_art[k][i],1))
            cur_max = song_art[k][i]

for k in res:
    print(f'{k} most resembles the work of {res[k][0]} (log-probability={res[k][1]})')