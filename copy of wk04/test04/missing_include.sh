#!/bin/dash
for file in "$@"
do
	includes=$(grep -E '^#include ".*"' "$file" | sed 's/#include \"\(.*\)\".*/\1/')
	
	for head_file in $includes
	do
		if test ! -r "$head_file"
		then
			echo "$head_file included into $file does not exist"
		fi
	done
done
