#!/bin/dash
# This test will test the tigger-commit
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

touch a b c d

./tigger-commit >> "$test_result"
./tigger-init >> "$test_result"
./tigger-commit xijs >> "$test_result"
./tigger-add a b c >> "$test_result"
./tigger-commit -m "1" >> "$test_result"
./tigger-commit -m "1" >> "$test_result"
./tigger-add d >> "$test_result"
./tigger-commit -m "2" >> "$test_result"
cat "$test_result" | sed '/^test/d' > "$test_result"

cat > "$test_answer" <<EOF
tigger-commit: error: tigger repository directory .tigger not found
Initialized empty tigger repository in .tigger
usage: tigger-commit [-a] -m commit-message
Committed as commit 0
nothing to commit
Committed as commit 1
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" a b c d