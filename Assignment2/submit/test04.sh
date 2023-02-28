#!/bin/dash
# This file will test the correctness of 'Comments & White Space' and '$'
# This script also test reading contents from multiple files

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"



cat >> CommandsFile <<EOF
5    q   #This is s comment!
EOF
#
seq 1 10 | ./slippy -f CommandsFile >> "$test_result"
cat > "$test_answer" <<EOF
1
2
3
4
5
EOF
rm CommandsFile


seq 111 115 | ./slippy '$p' >> "$test_result"
cat >> "$test_answer" <<EOF
111
112
113
114
115
115
EOF


seq 1 3 > f1
seq 10 15 > f2
./slippy -n '$p' f1 f2 >> "$test_result"
cat >> "$test_answer" <<EOF
15
EOF

seq 111 115 | ./slippy '$q' >> "$test_result"
cat >> "$test_answer" <<EOF
111
112
113
114
115
EOF

seq 111 115 | ./slippy '$d' >> "$test_result"
cat >> "$test_answer" <<EOF
111
112
113
114
EOF

./slippy '$d' f1 f2 >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
3
10
11
12
13
14
EOF


./slippy '$s/1/T/' f1 f2 >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
3
10
11
12
13
14
T5
EOF

rm f1 f2 


if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"