#!/bin/bash
#Desc: Verifica conectividad con mariadb
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
    #
    #
    ip=127.0.0.1
    dbuser=dbuser 
    dbpass=dbpass
    dbname=dbname
    l=$( mysql -h $ip  -u$dbuser -p$dbpass -e '\h' $dbname | grep 'Synonym for' 2>/dev/null | wc -l )
    if [ $l -gt 0 ]
    then
       echo "Ok"
    else
        echo "Not Ok"
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "Verifica conectividad con ldap"
fi

