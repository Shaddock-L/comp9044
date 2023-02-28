#!/bin/dash
# This is a test file for slippy q/p/d/s/(sg) (single)command with a single REGEX address
# This script also test reading contents from file

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

seq 11 15 | ./slippy '/4/q' >> "$test_result"
cat > "$test_answer" <<EOF
11
12
13
14
EOF

seq 111 115 | ./slippy '/2/p' >> "$test_result"
cat >> "$test_answer" <<EOF
111
112
112
113
114
115
EOF


seq 29 40 | ./slippy '/3/d' >> "$test_result"
cat >> "$test_answer" <<EOF
29
40
EOF


cat >> dic.txt <<EOF
hello
aaabc
pyth
cpp
world
java
EOF

./slippy '/o/s/l/~/' dic.txt >> "$test_result"
cat >> "$test_answer" <<EOF
he~lo
aaabc
pyth
cpp
wor~d
java
EOF

./slippy '/o/s/l/~/g' dic.txt >> "$test_result"
cat >> "$test_answer" <<EOF
he~~o
aaabc
pyth
cpp
wor~d
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
