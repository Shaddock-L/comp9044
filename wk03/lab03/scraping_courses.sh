#!/bin/sh

if test $# != 2
then
	echo "Usage: scraping_courses.sh <year> <course-prefix>"
	exit
elif grep -q '^[[:digit:]]*$' <<< "$1";
then
	if test $1 -lt 2019
	then	
		echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2022"
		exit
	elif test $1 -gt 2022
	then
		echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2022"
		exit
	fi
else
	echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2022"
	exit
	
fi


year=$1
prefix=$2

ug="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

pg="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"


wget -qO- $ug $pg | 2041 jq -r '.contentlets[] | .code, .title' |sed 'N;s/\n/ /g' | sed 's/  / /g' | sort | uniq
	
