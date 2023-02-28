#!/bin/dash

s="$1"
e="$2"


sn=$(echo "$s" |  sed 's/[^0-9]//g')
en=$(echo "$e" |  sed 's/[^0-9]//g')

i="$sn"


while test "$i" -le "$en"
do
    #echo "i is "$i""
    output=$(echo "$s" | sed -E "s/[0-9]+/$i/g")
    echo "$output"
    i=$((i+1))
done