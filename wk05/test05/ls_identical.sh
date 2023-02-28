#!/bin/dash

dir1=$1
dir2=$2

for file in "$dir1"/*
do
	fname=$(echo "$file" | sed 's/.*\/\(.*\)$/\1/')
	if test -e "$dir2/$fname"
	then
		if diff "$dir1/$fname" "$dir2/$fname" > /dev/null
		then
			echo "$fname"
		fi
	fi

done
