#!/bin/bash
#Desc: Verifica que el directorio /etc exista
#===============================================================================
#
#        AUTHOR:  Paul
#       COMPANY:  Dissociated Press
#       VERSION:  1.0
#      REVISION:  ---
#===============================================================================


programname=$0

function usage {
    echo "usage: $programname [-s] [-e]"
    echo "  -s      show the test"
    echo "  -e      execute the test"
    exit 1
}
if [ $# -eq 1 ]
then 
    if [ $1 = "-s" ]
    then 
        DOFlag="show"
    else
        DOFlag="do"
    fi
else
    usage
fi

if [ $DOFlag = "do" ]
then 
    main=$( ip addr | grep inet | grep -v 127.0.0.1 | gawk '{ print $2 }' | gawk 'BEGIN { FS="/" } { print $1 }' )
    postfix=$( cat /etc/postfix/main.cf | grep -v "^#" | grep "inet_interfaces" | gawk '{ print $3 }' )
    if [ "$main" = "$postfix" ]
    then
       echo "Ok"
    else
        echo "Not Ok"
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "directorio /etc debe existir"
fi

