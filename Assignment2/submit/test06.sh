#!/bin/dash
# This file will test the situation that address 2 ends before address 1. For example 4,2p

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

seq 1 10 | ./slippy '4,2p' >> "$test_result"
seq 1 10 | 2041 slippy '4,2p' >> "$test_answer"

seq 1 10 | ./slippy '4,2d' >> "$test_result"
seq 1 10 | 2041 slippy '4,2d' >> "$test_answer"

seq 1 10 | ./slippy '$,2s/1/A/' >> "$test_result"
seq 1 10 | 2041 slippy '$,2s/1/A/' >> "$test_answer"

seq 110 120 > f1
seq 150 180 > f2

./slippy '5,/1/p' f1 f2 >> "$test_result"
2041 slippy '5,/1/p' f1 f2 >> "$test_answer"

./slippy '5,/1/d' f1 f2 >> "$test_result"
2041 slippy '5,/1/d' f1 f2 >> "$test_answer"

./slippy '5,/1/d;$,2s/1/A/' f1 f2 >> "$test_result"
2041 slippy '5,/1/d;$,2s/1/A/' f1 f2 >> "$test_answer"

rm f1 f2

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"