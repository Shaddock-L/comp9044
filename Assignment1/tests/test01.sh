#!/bin/sh
# This test will test the tigger-add
rm -rf .tigger

if test ! -d "tests"
then
    mkdir "tests"
fi

test_result="./tests/test_res" 
test_answer="./tests/test_ans"

touch a b c d 123kk

./tigger-add a >> "$test_result"
./tigger-init >> "$test_result"
./tigger-add a b c >> "$test_result"
./tigger-add hello >> "$test_result"
touch ~xx
./tigger-add ~xx >> "$test_result"
./tigger-add 123kk >> "$test_result"

cat "$test_result" | sed '/^test/d' > "$test_result"

cat > "$test_answer" <<EOF
tigger-add: error: tigger repository directory .tigger not found
Initialized empty tigger repository in .tigger
tigger-add: error: can not open 'hello'
tigger-add: error: invalid filename '~xx'
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer"
rm a b c d ~xx 123kk