#!/bin/dash

most_lines_filename=""
max_lines=0

for file in "$@"
do
	line_count=$(wc -l < "$file")
	if test "$line_count" -gt "$max_lines"
	then
		max_lines="$line_count"
		most_lines_filename="$file"
	fi
done

echo "$most_lines_filename"
