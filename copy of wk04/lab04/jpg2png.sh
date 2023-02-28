#!/bin/dash
for file in *.jpg
do
	new_filename=$(echo "$file" | sed 's/jpg$/png/')
	if test -e "$new_filename"
	then
		echo "$new_filename already exists"
		exit 1
	elif test -e "$file"
	then
		convert "$file" "$new_filename" >/dev/null 2>&1
		rm "$file"
	fi

done

