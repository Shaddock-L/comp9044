#!/bin/sh
# This test will test the tigger-rm  more error cases
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"


./tigger-init >> "$test_result"
echo hello >a
./tigger-add a >> "$test_result"
./tigger-commit -m "1" >> "$test_result"

echo nihao >b
echo hallo >c
echo bonjour >d
./tigger-add b c >> "$test_result"
./tigger-status >> "$test_result"
echo newWords >>b
rm d
rm c
./tigger-status >> "$test_result"

cat "$test_result" | sed '/^test/d' > "$test_result"

cat > "$test_answer" <<EOF
Initialized empty tigger repository in .tigger
Committed as commit 0
a - same as repo
b - added to index
c - added to index
d - untracked
a - same as repo
b - added to index, file changed
c - added to index, file deleted
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" a b 