#!/bin/dash

begin=$1
end=$2
filename=$3

if test -e "$filename"
then 
	rm "$filename"
fi

while test "$begin" -le "$end"
do
	echo "$begin" >> "$filename"
	begin=$((begin + 1))	
done

