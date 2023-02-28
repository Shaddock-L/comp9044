#!/bin/dash

if test "$#" != 1
then
	echo "Only accept 1 argument"
	exit 1
fi

num="$1"

if test ! -e ."snapshot"."$num"
then
	echo "No such directory"
	exit 1	
fi

snapshot-save.sh


for file in ."snapshot"."$num"/*
do
	cp "$file" .

done

echo "Restoring snapshot "$num""


