#!/bin/dash

if test -e "log.6"
then
    if ! test -d "archive"
    then
        mkdir "archive"
    fi
    gzip "log.6"
    mv "log.6.gz" "archive/log.$(date +'%Y_%m_%d').gz"
fi

if test -e "log.5"
then
    mv "log.5" "log.6"
fi

if test -e "log.4"
then
    mv "log.4" "log.5"
fi

if test -e "log.3"
then
    mv "log.3" "log.4"
fi

if test -e "log.2"
then
    mv "log.2" "log.3"
fi

if test -e "log.1"
then
    mv "log.1" "log.2"
fi

if test -e "log"
then
    mv "log" "log.1"
fi