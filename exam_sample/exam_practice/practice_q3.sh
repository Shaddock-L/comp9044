#!/bin/dash

for dir in *
do
    if test -d "$dir"
    then
        cnt=0
        for f in ./"$dir"/*
        do
            #echo "$f"
            if test -e "$f" || test -d "$f"
            then
                cnt=$((cnt + 1))
                #echo "$cnt"
            fi
        done
        
        if test "$cnt" -ge 2
        then 
            echo "$dir"
        fi
    fi


done