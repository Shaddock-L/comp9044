#!/bin/dash
# This file will test the append/insert/change command


if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

seq 1 10 | ./slippy '5a new line' >> "$test_result"
seq 1 10 | 2041 slippy '5a new line'  >> "$test_answer"

seq 1 10 | ./slippy '5i new line' >> "$test_result"
seq 1 10 | 2041 slippy '5i new line'  >> "$test_answer"


seq 1 10 | ./slippy '5c new line' >> "$test_result"
seq 1 10 | 2041 slippy '5c new line'  >> "$test_answer"



if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"