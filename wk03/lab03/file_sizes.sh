#!/bin/sh

small=""
medium=""
large=""
space=" "

for f in $(ls)
do
	size=$(wc -l ${f} | cut -d' ' -f1)
	if test $size -lt 10
	then
		#small=${small}${space}${f}
		small=$small$space$f
	elif test $size -lt 100
	then
		#medium=${medium}${space}${f}
		medium=$medium$space$f
	else
		#large=${large}${space}${f}
		large=$large$space$f
	fi
done

echo "Small files:$small"
echo "Medium-sized files:$medium"
echo "Large files:$large"
