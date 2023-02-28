#!/bin/dash

prefix=$1
cnt=0

while(test -r ."$prefix"."$cnt")
do
	cnt=$((cnt + 1))
	
done

cp "$prefix" ."$prefix"."$cnt"
echo "Backup of '"$prefix"' saved as '."$prefix"."$cnt"'"
