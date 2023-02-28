#!/bin/dash
# This file will test the correctness of Multiple commands/ Multiple commands in different orders

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"





seq 1 10 | ./slippy '4q;5d' >> "$test_result"
seq 1 10 | 2041 slippy '4q;5d' >>"$test_answer"

seq 1 10 | ./slippy '5d;5p' >> "$test_result"
seq 1 10 | 2041 slippy '5d;5p' >>"$test_answer"

seq 1 10 | ./slippy '5p; 5d' >> "$test_result"
seq 1 10 | 2041 slippy '5p; 5d' >>"$test_answer"

cat > CommandsFile <<EOF
2,4p
s/1/A/
EOF

seq 110 120 | ./slippy -f CommandsFile >> "$test_result"
seq 110 120 | 2041 slippy -f CommandsFile >> "$test_answer"

rm CommandsFile

seq 11 12 > f1
seq 11 15 > f2

./slippy '/2/d;4q' f1 f2 >> "$test_result"
cat >> "$test_answer" <<EOF
11
11
13
14
15
EOF

./slippy '4q;/2/d' f1 f2 >> "$test_result"
cat >> "$test_answer" <<EOF
11
11
12
EOF
rm f1 f2

seq 110 120 | ./slippy '5p; 4d; $s/2/B/' >> "$test_result"
seq 110 120 | 2041 slippy '5p; 4d; $s/2/B/' >>"$test_answer"



if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"