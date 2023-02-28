#!/bin/dash
# This test will test the tigger-log
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

touch a b c d

./tigger-log >> "$test_result"
./tigger-init >> "$test_result"
./tigger-log >> "$test_result"
./tigger-add a >> "$test_result"
./tigger-commit -m "first commit" >> "$test_result"
echo second_version > a
echo bbb >> a
./tigger-add a >> "$test_result"
./tigger-commit -m "second commit" >> "$test_result"
./tigger-log >> "$test_result"
cat "$test_result" | sed '/^test/d' > test_temp
cat test_temp > "$test_result"
rm test_temp

cat > "$test_answer" <<EOF
tigger-log: error: tigger repository directory .tigger not found
Initialized empty tigger repository in .tigger
Committed as commit 0
Committed as commit 1
1 second commit
0 first commit
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" a b c d
rm -rf .tigger