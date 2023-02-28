#!/bin/dash

./tigger-init
touch a b  
./tigger-add a b
./tigger-commit -m "1"
rm a
./tigger-commit -m "2"
./tigger-add a
./tigger-commit -m "2"