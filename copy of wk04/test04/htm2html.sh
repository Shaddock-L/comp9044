#!/bin/dash
for file in *.htm
do
	new_filename=$(echo "$file" | sed 's/htm$/html/')
	
	if test -e "$new_filename"
	then
		echo "$new_filename exists"
		exit 1
	else
		mv -- "$file" "$new_filename"
	fi


done
