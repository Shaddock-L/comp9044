#!/bin/dash

./tigger-init
touch a b  
./tigger-add a b
./tigger-commit -m "1"
rm a
./tigger-commit -m "2"
./tigger-add a
./tigger-commit -m "2"
./tigger-rm --cached b
./tigger-commit -m "3"
./tigger-rm b
#tigger-rm: error: 'b' is not in the tigger repository
./tigger-add b
#./tigger-rm b
