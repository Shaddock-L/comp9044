#!/bin/dash
#Title, Artist, Track, Album, and Year

for path in "$@"
do
	Album=$(echo "$path" | cut -d'/' -f2)
	#echo $dir	
	Year=$(echo "$path" | sed 's/.*, //')
	#echo $year
	cd "$path" || exit 
	
	for mp3_file in *
	do
		#echo "$mp3_file"
		Title=$(echo "$mp3_file" | sed 's/^.*- \(.*\)-.*$/\1/')
		#echo "$Title"
		Artist=$(echo "$mp3_file" | sed 's/^.*- \(.*\)\.mp3$/\1/')
		#echo "$Artist"
		Track=$(echo "$mp3_file" | sed 's/^\([0-9]*\) -.*/\1/')
		#echo "$Track"
		
		id3 -t "$Title" "$mp3_file" >/dev/null
		id3 -a "$Artist" "$mp3_file" >/dev/null
		id3 -T "$Track" "$mp3_file" >/dev/null
		id3 -A "$Album" "$mp3_file" >/dev/null
		id3 -y "$Year" "$mp3_file" >/dev/null

	done
	cd "${OLDPWD}" || exit

done
