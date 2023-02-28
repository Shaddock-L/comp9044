#!/usr/bin/env python3
from collections import defaultdict
import sys

start = sys.argv[2]
end = sys.argv[3]

filename = sys.argv[1]
dic = []
with open(filename, "r") as f:
    for line in f:
       word = line.strip()
       if len(word) == len(start):
           dic.append(word)

def findLadders(beginWord, endWord, wordList):
    if endWord not in wordList:
        return []
    n = len(wordList)
    wordSet = set(wordList)
    begin = set([beginWord])
    end = set([endWord])
    wordSet.remove(endWord)
    if beginWord in wordSet:
        wordSet.remove(beginWord)
    forward = defaultdict(list)
    backward = defaultdict(list)
    forward[beginWord].append([beginWord])
    backward[endWord].append([endWord])
    fw = True
    res = []
    while begin and end:
        if len(begin) > len(end):
            begin, end = end, begin
            fw = not fw
        new_begin = set()
        new_words = set()
        for word in begin:
            for ch in range(len(word)):
                for i in range(26):
                    new_word = word[:ch] + chr(ord('a') + i) + word[ch + 1:]
                    if new_word in end:
                        if fw:
                            for path1 in forward[word]:
                                for path2 in backward[new_word]:
                                    res.append(path1 + path2)
                        else:
                            for path1 in forward[new_word]:
                                for path2 in backward[word]:
                                    res.append(path1 + path2)
                    elif new_word in wordSet:
                        new_words.add(new_word)
                        new_begin.add(new_word)
                        if fw:
                            for path in forward[word]:
                                forward[new_word].append(path + [new_word])
                        else:
                            for path in backward[word]:
                                backward[new_word].append([new_word] + path)         
        if len(res) > 0:
            break
        begin = new_begin
        wordSet = wordSet - new_words

    return res

ans = findLadders(start, end, dic)
if len(ans) > 0:
    for k in ans[0]:
        print(k)
else:
    print("No solution")
