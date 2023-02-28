#!/bin/dash
for image in "$@"
do
	
	date=$(ls -l "$image" | cut -d' ' -f6,7,8)
	TMP_FILE1=$(mktemp /tmp/image_tmp.1.XXXXXXXXXX)
	trap 'rm -f $TMP_FILE1 exit' INT TERM EXIT
	convert -gravity south -pointsize 36 -draw "text 0,10 '$date'" "$image" "$TMP_FILE1"

	mv "$TMP_FILE1" "$image"
	
		
	

done
