#!/bin/sh
if test $# != 2
then
	echo 'Usage: ./echon.sh <number of lines> <string>'
	exit
elif test $# = 2
then
	n=$1
	string=$2
	i=0
	#if grep -q '^[0-9][[:digit:]]*$' <<< "$n";
	if echo "$n" | grep '^[0-9][0-9]*$'  > /dev/null 2>&1;
	then
		while test $i -lt $n
		do
			echo "$string"
			i=$((i+1))
		done

	else
		echo './echon.sh: argument 1 must be a non-negative integer'
		exit
	fi
fi





