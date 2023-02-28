#!/bin/dash

prefix=".snapshot"
cnt=0

while(test -d "$prefix"."$cnt")
do
	cnt=$((cnt + 1))

done

mkdir "$prefix"."$cnt"

for file in *
do
	if (test "$file" != "snapshot-save.sh") && (test "$file" != "snapshot-load.sh")
	then
		cp "$file" "$prefix"."$cnt"/
	fi
done

echo "Creating snapshot "$cnt""
