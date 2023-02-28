#!/bin/dash
if test $# != 2
then exit 1
fi

count=1
number=$1
name=$2

while test "$count" -le "$number"
do
	file="hello"$count".txt"
	echo "hello "$name"" > "$file"
	count=$((count + 1))
done
