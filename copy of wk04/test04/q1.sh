#!/bin/dash
start=$1
end=$2
name=$3
while test "$start" -le "$end"
do
	echo "$start" >> "$name"
	start=$((start + 1))
done

