#!/bin/dash
# This is a test file for slippy q/p/d/s/(sg) (single)command with a single digit address

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

seq 1 5 | ./slippy '3q' >> "$test_result"
cat > "$test_answer" <<EOF
1
2
3
EOF

seq 1 5 | ./slippy '3p' >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
3
3
4
5
EOF

seq 1 5 | ./slippy '3d' >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
4
5
EOF

seq 1 5 | ./slippy '3s/3/new_line/' >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
new_line
4
5
EOF

seq 111 115 | ./slippy 's/1/A/g' >> "$test_result"
cat >> "$test_answer" <<EOF
AAA
AA2
AA3
AA4
AA5
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer"