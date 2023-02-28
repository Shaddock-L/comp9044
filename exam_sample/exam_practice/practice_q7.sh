#!/bin/dash

if ! test -d ".git"
then
    echo "$0: Not a git repository"
    exit 1
fi

#if test $(git log > /dev/null 2>&1 | grep -E "fatal: your current branch 'master' does not have any commits yet") ='0'
if [ -n "$(git log 2>&1 | grep -E "your current branch '[^']+' does not have any commits yet")" ]
then
    echo "$0: No Commits"
    exit 1
fi

#last=$(git log | tail -3 | head -1| sed 's/Date: *//')
#echo -n "Last Commit Date: "
echo -n "Last Commit Date: "
# git log |
#     grep 'Date:' |
#     sed -En '
#         s/Date:[[:space:]]*|[[:space:]]*$//g
#         1p
#         '
last=$(git log | grep 'Date:'| head -1 | sed 's/Date: *//')
echo "$last"
echo "Number of Commits per Author:"
git log | grep 'Author:' | sed 's/<.*>//g' | sed 's/Author: //g'|sort | uniq -c| sort -r



#git log | grep 'Author:' | sed 's/<.*>//g' | sed 's/Author: //g'|sort | uniq -c| sort -r