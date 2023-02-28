#!/bin/sh
# This test will test the tigger-rm  more error cases
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

touch a b c d e f g h
./tigger-init >> "$test_result"
./tigger-add a b c d e f >> "$test_result"
./tigger-commit -m "1" >> "$test_result"
echo hello >a
echo world >b
echo bonjour >c
./tigger-add a b >> "$test_result"
echo nihao >b
rm e
./tigger-rm d >> "$test_result"
./tigger-add g >> "$test_result"
./tigger-status >> "$test_result"

cat "$test_result" | sed '/^test/d' > "$test_result"

cat > "$test_answer" <<EOF
Initialized empty tigger repository in .tigger
Committed as commit 0
a - file changed, changes staged for commit
b - file changed, different changes staged for commit
c - file changed, changes not staged for commit
d - deleted
e - file deleted
f - same as repo
g - added to index
h - untracked
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" a b c f g h