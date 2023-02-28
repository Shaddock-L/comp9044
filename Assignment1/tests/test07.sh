#!/bin/sh
# This test will test the tigger-rm  more error cases
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

echo comp >a
echo 9044 >b
echo cool >c
./tigger-init >> "$test_result"
./tigger-add a b c >> "$test_result"
./tigger-commit -m "first commit" >> "$test_result"
echo hello >>a
echo world >>b
echo this >>c
echo is >d
echo new >e
./tigger-add b c d >> "$test_result"
echo reload >b
./tigger-rm a >> "$test_result"
./tigger-rm b >> "$test_result"
./tigger-rm d >> "$test_result"
./tigger-rm e >> "$test_result"
./tigger-rm --cached a >> "$test_result"
./tigger-rm --cached b >> "$test_result"
./tigger-rm --cached c >> "$test_result"
./tigger-rm --cached d >> "$test_result"
./tigger-rm --cached e >> "$test_result"
./tigger-rm --force d >> "$test_result"

cat "$test_result" | sed '/^test/d' > "$test_result"

cat > "$test_answer" <<EOF
Initialized empty tigger repository in .tigger
Committed as commit 0
tigger-rm: error: 'a' in the repository is different to the working file
tigger-rm: error: 'b' in index is different to both the working file and the repository
tigger-rm: error: 'd' has staged changes in the index
tigger-rm: error: 'e' is not in the tigger repository
tigger-rm: error: 'b' in index is different to both the working file and the repository
tigger-rm: error: 'e' is not in the tigger repository
tigger-rm: error: 'd' is not in the tigger repository
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" a b c d e