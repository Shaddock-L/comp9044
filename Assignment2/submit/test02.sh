#!/bin/dash
# This is a test file for slippy q/p/d/sg (single)command with a range of address
# This script also test reading contents from file

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

seq 11 15 | ./slippy '2,4q' >> "$test_result"
cat > "$test_answer" <<EOF
slippy: command line: invalid command
EOF

seq 111 115 | ./slippy '/2/,/4/p' >> "$test_result"
cat >> "$test_answer" <<EOF
111
112
112
113
113
114
114
115
EOF


seq 1 10 | ./slippy '3,9d' >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
10
EOF


cat >> dic.txt <<EOF
first line
hello
aaabc
python
cppoo
world
java
EOF

./slippy '/ll/,/pp//s/o/8/g' dic.txt >> "$test_result"
cat >> "$test_answer" <<EOF
first line
hell8
aaabc
pyth8n
cpp88
world
java
EOF


rm dic.txt

# seq 111 115 | ./slippy 's/1/A/g' >> "$test_result"
# cat >> "$test_answer" <<EOF

# EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"