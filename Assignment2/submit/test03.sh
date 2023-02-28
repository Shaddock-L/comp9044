#!/bin/dash
# This is a test file for slippy -f, -n option + single command
# This script also test reading contents from one file and multiple files

if test ! -d "tests"
then
    mkdir "tests"
fi
test_result="./tests/test_res" 
test_answer="./tests/test_ans"



cat >> CommandsFile <<EOF
5q
EOF

seq 1 10 | ./slippy -f CommandsFile  >> "$test_result"
cat > "$test_answer" <<EOF
1
2
3
4
5
EOF
rm CommandsFile

cat >> dic.txt <<EOF
aaa
bbb
bcc
dddd
eeeeebss
gggg
zzzz
EOF
./slippy -n '/b/p' dic.txt >> "$test_result"
cat >> "$test_answer" <<EOF
bbb
bcc
eeeeebss
EOF
rm dic.txt

seq 1 3 > f1
seq 10 15 > f2
./slippy '5q' f1 f2 >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
3
10
11
EOF


cat >> CommandsFile <<EOF
3,5d
EOF
./slippy -f CommandsFile f1 f2 >> "$test_result"
cat >> "$test_answer" <<EOF
1
2
12
13
14
15
EOF

rm f1 f2 CommandsFile


if diff "$test_result" "$test_answer" > /dev/null
then
    echo "pass"
else
    echo "failed"
    diff "$test_result" "$test_answer"
    
fi

rm "$test_result" "$test_answer"