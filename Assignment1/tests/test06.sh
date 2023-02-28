#!/bin/sh
# This test will test the tigger-rm 
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

touch a b c d

./tigger-rm >> "$test_result"
./tigger-init >> "$test_result"
./tigger-rm >> "$test_result"
./tigger-add a b >> "$test_result"
./tigger-commit -m "1" >> "$test_result"
./tigger-rm k >> "$test_result"
./tigger-rm a >> "$test_result"

cat "$test_result" | sed '/^test/d' > "$test_result"

cat > "$test_answer" <<EOF
tigger-rm: error: tigger repository directory .tigger not found
Initialized empty tigger repository in .tigger
usage: tigger-rm [--force] [--cached] <filenames>
Committed as commit 0
tigger-rm: error: 'k' is not in the tigger repository
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    if test ! -e a && test ! -e ".tigger/index/a"
    then 
        echo "pass"
    else
        echo "failed"
    fi
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" b c d