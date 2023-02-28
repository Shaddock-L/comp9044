#!/bin/dash

for file in *
do
    if test -d $file
    then
        if test $(ls $file| wc -l) -ge 2
        then
            echo $file
        fi
    fi


done
