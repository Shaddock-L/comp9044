#!/bin/dash

dir1=$1
dir2=$2

for file in "$dir1"/*
do
    name=$(basename "$file")
    # if test -e "$dir2/$name"
    # then
    #     if diff "$dir1/$name" "$dir2/$name" > /dev/null 2>&1
    #     then
    #         echo $name
    #         #echo "hello"
    #     fi
    # fi
    if diff $file "$dir2" > /dev/null 2>&1
    then
        echo $name
    fi


done