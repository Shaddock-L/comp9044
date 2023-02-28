#!/bin/dash
for file in $@
do
	includes=$(cat $file | grep -E "^#include \"" | sed -E "s/#include \"(.*)\".*/\1/")
	for ele in $includes
	do
		if ! test -r $ele
		then
			echo "$ele included into $file does not exist" 1>&2
		fi
	done






done

