#!/bin/dash

2041 tigger-init
touch a b  
2041 tigger-add a b
2041 tigger-commit -m "1"
rm a
2041 tigger-commit -m "2"
2041 tigger-add a
2041 tigger-commit -m "2"
2041 tigger-rm --cached b
2041 tigger-commit -m "3"
2041 tigger-rm b
#tigger-rm: error: 'b' is not in the tigger repository
2041 tigger-add b
#./tigger-rm b
