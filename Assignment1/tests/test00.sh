#!/bin/sh
# This test will test the tigger-init
rm -rf .tigger

test_result="./tests/test1_res" 
test_answer="./tests/test1_ans"

./tigger-init >> "$test_result"
./tigger-init >> "$test_result"
./tigger-init abc >> "$test_result"

cat "./tests/test1_res" | sed '/^test/d' > ./tests/test1_res

cat > "./tests/test1_ans" <<EOF
Initialized empty tigger repository in .tigger
tigger-init: error: .tigger already exists
usage: tigger-init
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer"
