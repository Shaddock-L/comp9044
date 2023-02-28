#!/bin/sh

flag=0
if test $# != 2
then
	echo "Usage: scraping_courses.sh <year> <course-prefix>"
	exit
elif grep -q '^[[:digit:]]*$' <<< "$1";
then
	if test $1 -lt 2019
	then
		if test $1 -lt 2005
		then
			echo "./advanced_scraping_courses.sh: argument 1 must be an integer between 2005 and 2022"
			exit
		else
			flag=1
		fi

	elif test $1 -gt 2022
	then
		echo "./advanced_scraping_courses.sh: argument 1 must be an integer between 2005 and 2022"
		exit
	fi
else
	echo "./advanced_scraping_courses.sh: argument 1 must be an integer between 2005 and 2022"
	exit
	
fi


year=$1
prefix=$2

if test $flag == 0
then
	ug="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

	pg="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"


	wget -qO- $ug $pg | 2041 jq -r '.contentlets[] | .code, .title' |sed 'N;s/\n/ /g' | sed 's/  / /g' | sort | uniq
elif test $flag == 1
then
	url="https://legacy.handbook.unsw.edu.au/assets/json/search/$1data.json"
	wget -qO- $url | 2041 jq -r '.[] | {filename: .code,shortdes:  .shortdescription, career: .career}|select(.career == "undergraduate" or .career == "postgraduate")' | sed 's/"career".*//g'| sed 's/""/null,/g' | sed 's/{//g'| sed 's/}//g' | sed 's/"filename": //g'  | sed 's/"shortdes": //g' | sed 's/",//g'| sed 's/"//g'  | sed 's/^  //g' | sed '/^\s*$/d' | sed 'N;s/\n/ /g'| sed 's/null,//g'  | sed 's/\\n//g'|grep -P "^[A-Z]{4}[0-9].*$"| grep -e "^$2" | sed 's/  / /g'| sort | uniq | sed 's/  / /g'


fi
	
