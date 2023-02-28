#!/bin/dash
# This file will test the situation that addresses in multiple commands have conflicts
# for example   **1,/.1/p** and **/.2/,/.9/p** in '1,/.1/p;/5/,/9/s/.//;/.2/,/.9/p;85q'

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

seq 1 100 | ./slippy -n '1,/.1/p;/5/,/9/s/.//;/.2/,/.9/p;85q' >> "$test_result"
seq 1 100 | 2041 slippy -n '1,/.1/p;/5/,/9/s/.//;/.2/,/.9/p;85q' >> "$test_answer"

seq 1 100 | ./slippy '/8/,4d; /1/,/3/d' >> "$test_result"
seq 1 100 | 2041 slippy '/8/,4d; /1/,/3/d' >> "$test_answer"

seq 1 100 | ./slippy '1,/.1/p;/5/,/9/s/./A/;/7/,/8/s/./b/;60q' >> "$test_result"
seq 1 100 | 2041 slippy '1,/.1/p;/5/,/9/s/./A/;/7/,/8/s/./b/;60q' >> "$test_answer"


if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"