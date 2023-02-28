#!/bin/dash
# This is a test file for slippy, test different delimit characters , infinite stdin
#  and some other cases


if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"

cat > CommandsFile <<EOF
5    p   #comment
6,10s/4/M/g #  comm
/3/d; 14q #bbbbb
EOF

seq 110 120 > f1
seq 210 220 > f2

./slippy -f CommandsFile f1 f2 >> "$test_result"
2041 slippy -f CommandsFile f1 f2 >> "$test_answer"


seq 1 10 | ./slippy 's?[13579]?odd?' >> "$test_result"
seq 1 10 | 2041 slippy 's?[13579]?odd?' >> "$test_answer"

seq 1 10 | ./slippy 'sa[159]a/ne__wa' >> "$test_result"
seq 1 10 | 2041 slippy 'sa[159]a/ne__wa' >> "$test_answer"

yes hello | ./slippy '5q; s/e/E/g' >> "$test_result"
yes hello | 2041 slippy '5q; s/e/E/g' >> "$test_answer"

seq 10 30 | ./slippy -n '/^1/p' >> "$test_result"
seq 10 30 | 2041 slippy -n '/^1/p' >> "$test_answer"

seq 10 30 | ./slippy -n '/0$/p' >> "$test_result"
seq 10 30 | 2041 slippy -n '/0$/p' >> "$test_answer"

rm CommandsFile f1 f2
if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"