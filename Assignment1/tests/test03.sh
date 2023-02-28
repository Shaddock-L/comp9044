#!/bin/sh
# This test will test the tigger-show
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

touch a b c d
echo hello >a

./tigger-show >> "$test_result"
./tigger-init >> "$test_result"
./tigger-add a >> "$test_result"
./tigger-commit -m "1" >> "$test_result"
echo second_version > a
echo bbb >> a
./tigger-add a >> "$test_result"
./tigger-commit -m "2" >> "$test_result"
./tigger-show  >> "$test_result"
./tigger-show "_" >> "$test_result"
./tigger-show "_:" >> "$test_result"
./tigger-show :a >> "$test_result"
./tigger-show 0:a >> "$test_result"
./tigger-show 10:a >> "$test_result"

cat "$test_result" | sed '/^test/d' > "$test_result"

cat > "$test_answer" <<EOF
tigger-show: error: tigger repository directory .tigger not found
Initialized empty tigger repository in .tigger
Committed as commit 0
Committed as commit 1
usage: tigger-show <commit>:<filename>
usage: tigger-show <commit>:<filename>
tigger-show: error: unknown commit '_'
second_version
bbb
hello
tigger-show: error: unknown commit '10'
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" a b c d