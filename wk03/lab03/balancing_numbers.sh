#!/bin/sh

while read answer
do
	echo $answer | tr [0-4] '<' | tr [6-9] '>'
done
