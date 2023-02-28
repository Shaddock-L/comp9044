#!/bin/dash
# This test will test the tigger-commit -a option
rm -rf .tigger
if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

touch a b c d

echo hello > a

./tigger-init >> "$test_result"
./tigger-add a b c >> "$test_result"
echo world > a
./tigger-commit -a -m "1" >> "$test_result"


cat "$test_result" | sed '/^test/d' > test_temp
cat test_temp > "$test_result"
rm test_temp

cat > "$test_answer" <<EOF
Initialized empty tigger repository in .tigger
Committed as commit 0
EOF

if diff "$test_result" "$test_answer" > /dev/null
then
    if diff a ".tigger/index/a" > /dev/null
    then 
        echo "pass"
    else
        echo "failed"
    fi
else
    echo "failed"
    diff "$test_result" "$test_answer"
fi

rm "$test_result" "$test_answer" a b c d
rm -rf .tigger